//
//  SleepAccess.swift
//  BabySleep
//
//  Created by Igor on 28.10.2019.
//  Copyright © 2019 Денис Львович. All rights reserved.
//

import Foundation
import RealmSwift

final class SleepAccess {

    private var objects: Results<Sleep>?
    private var notificationToken: NotificationToken?

    private func realmInit() -> Realm? {

        do {
            let realmContext = try Realm()
            return realmContext
        } catch {
            AlertCenter().showNotificationAlert(withType: .dataAccessError)
            assertionFailure(error.localizedDescription)
            return nil
        }
    }

    func writeToRealm(objects: [Sleep]) {

        guard let realm = self.realmInit() else { return }

        do {
            try realm.write {
                realm.add(objects, update: .modified)
            }

        } catch {
            assertionFailure(error.localizedDescription)
        }
    }
    
    func fetch(classType: Sleep.Type,
               sortedBy key: String,
               withFilter filter: NSPredicate) -> [Sleep] {
        
        guard let realm = self.realmInit() else { return []}
        
        objects = realm.objects(classType)
            .sorted(byKeyPath: key, ascending: true)
            .filter(filter)
        
        if let objects = self.objects {
            return Array(objects)
        } else {
            return []
        }
    }
    
    func fetchAll(classType: Sleep.Type, sortedBy key: String) -> [Sleep] {
        
        guard let realm = self.realmInit() else { return []}
        
        objects = realm.objects(classType).sorted(byKeyPath: key, ascending: true)
        if let objects = self.objects {
            return Array(objects)
        } else {
            return []
        }
    }
    
    func fetchObjectsByDate(Date: Date) -> [Sleep] {

        guard let realm = self.realmInit() else { return [] }

        let results = realm.objects(Sleep.self).filter("startSleepTime == %i", Date).sorted(byKeyPath: "startSleepTime", ascending: true)
        return Array(results)
    }

    func fetchObjectByID(id: String) -> Sleep? {

        guard let realm = self.realmInit() else { return nil }

        return realm.object(ofType: Sleep.self, forPrimaryKey: id)
    }
    
    func deleteObject(id: String) {
        
        guard let realm = self.realmInit(),
            let object = self.fetchObjectByID(id: id) else { return }
        
        do {
            try realm.write {
                realm.delete(object)
            }
            
        } catch {
            assertionFailure(error.localizedDescription)
        }
    }
    
    func deleteAll(classType: Sleep.Type) {

        guard let realm = self.realmInit() else { return }

        do {
            let allObjects = realm.objects(classType)

            try realm.write {
                realm.delete(allObjects)
            }

        } catch {
            assertionFailure(error.localizedDescription)
        }
    }

    func subscribe(callback: @escaping (_ arr: [AnyObject]) -> Void) {

        guard let objects = self.objects else { return }

        self.notificationToken = objects.observe { [weak self] _ in
            if let objects = self?.objects {
                callback(Array(objects))
            } else {
            }
        }
    }

    func unsubscribe() {
        self.notificationToken?.invalidate()
    }
}
