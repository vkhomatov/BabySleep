//
//  RealmAccess.swift
//  BabySleep
//
//  Created by Денис Львович on 10/10/2019.
//  Copyright © 2019 Денис Львович. All rights reserved.
//

import RealmSwift

final class RealmAccess<T> where T: Object {

    private var objects: Results<T>?
    private var token: NotificationToken?

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

    func update<T>(withObjects objects: [T]) where T: Object {

        guard let realm = self.realmInit() else { return }

        do {
            try realm.write {
                realm.add(objects, update: true)
            }

        } catch {
            assertionFailure(error.localizedDescription)
        }
    }

    func updateExistObject(callback: () -> Void) {
        guard let realm = self.realmInit() else { return }

        do {
            try realm.write {
                callback()
            }

        } catch {
            assertionFailure(error.localizedDescription)
        }
    }

    func deleteAll<T>(withType classType: T.Type) where T: Object {

        guard let realm = self.realmInit() else { return }

        do {
            let oldEntities = realm.objects(classType)

            try realm.write {
                realm.delete(oldEntities)
            }

        } catch {
            assertionFailure(error.localizedDescription)
        }
    }

    func deleteObject<T>(withType classType: T.Type, andId id: String) where T: Object, T: Identifiable {

        guard let realm = self.realmInit(),
            let object = self.fetchObject(withType: classType, andId: id) else { return }

        do {
            try realm.write {
                realm.delete(object)
            }

        } catch {
            assertionFailure(error.localizedDescription)
        }
    }

    func fetchAll(withType classType: T.Type, sortedBy key: String) -> [T] {

        guard let realm = self.realmInit() else { return []}

        objects = realm.objects(classType).sorted(byKeyPath: key, ascending: true)
        if let objects = self.objects {
            return Array(objects)
        } else {
            return []
        }
    }

    func fetch(withType classType: T.Type,
               sortedBy key: String,
               withFilter filter: NSPredicate) -> [T] {

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

    func fetchObject<T>(withType classType: T.Type, andId id: String) -> T? where T: Object {

        guard let realm = self.realmInit() else { return nil }

        return realm.object(ofType: classType, forPrimaryKey: id)
    }

    func printPath() {

        guard let realm = self.realmInit() else { return }

        print(realm.configuration.fileURL as Any)
    }

    func subscribe(callback: @escaping (_ arr: [AnyObject]) -> Void) {

        guard let objects = self.objects else { return }

        self.token = objects.observe { [weak self] _ in
            if let objects = self?.objects {
                callback(Array(objects))
            } else {
                // TODO: Кинуть исключение
            }
        }
    }

    func unsubscribe() {
        self.token?.invalidate()
    }
}

