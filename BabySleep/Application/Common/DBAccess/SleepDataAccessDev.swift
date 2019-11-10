//
//  SleepDataAccessDev.swift
//  BabySleep
//
//  Created by Денис Львович on 11/11/2019.
//  Copyright © 2019 Денис Львович. All rights reserved.
//

final class SleepDataAccessDev: SleepDataAccess {

    let realm = RealmAccess()

    /// Вытаскивает все сны из базы
    func getAllSleeps() -> [Sleep] {
        guard let sleeps = realm.fetchAll(withType: SleepRealm.self,
                                             sortedBy: "created") as? [Sleep] else {
                                                /// TODO: Log error
                                                return []
        }
        return sleeps
    }

    /// Вытаскивает все сны за определённый день календаря
    func getSleeps(forDate: CalendarDate) -> [Sleep] {
        return []
        // TODO: Реализовать
    }

    /// Вытаскивает конкретный сон по ID
    func getSleep(withId id: String) -> Sleep? {
        guard let sleep = realm.fetchObject(withType: SleepRealm.self, andId: id) else {
            return nil
        }
        return sleep
    }

    /// Записывает сон в базу
    func addNewSleep(object: Sleep) {
        if let object = object as? SleepRealm {
            realm.update(withObjects: [object])
        }
    }

    /// Обновляет существующий сон
    func updateExistSleep(callback: () -> Void) {
        realm.updateExistObject {
            callback()
        }
    }

    /// Подписывает на обновления модели
    func subscribe(callback: @escaping (_ plans: [Sleep]) -> Void) {
        realm.subscribe { objects in
            guard let sleeps = objects as? [Sleep] else {
                // TODO: Кинуть исключение
                return
            }
            callback(sleeps)
        }
    }

    /// Отписывает от обновлений
    func unsubscribe() {
        realm.unsubscribe()
    }
}
