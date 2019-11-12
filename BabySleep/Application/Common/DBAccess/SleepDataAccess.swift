//
//  SleepDataAccess.swift
//  BabySleep
//
//  Created by Денис Львович on 11/11/2019.
//  Copyright © 2019 Денис Львович. All rights reserved.
//

protocol SleepDataAccess {

    /// Вытаскивает все сны из базы
    func getAllSleeps() -> [Sleep]

    /// Вытаскивает все сны за определённый день календаря
    func getSleeps(forDate: CalendarDate) -> [Sleep]

    /// Вытаскивает конкретный сон по ID
    func getSleep(withId id: String) -> Sleep?

    /// Записывает сон в базу
    func addNewSleep(object: Sleep)

    /// Обновляет существующий сон
    func updateExistSleep(callback: () -> Void)

    /// Подписывает на обновления модели
    func subscribe(callback: @escaping (_ plans: [Sleep]) -> Void)

    /// Отписывает от обновлений
    func unsubscribe()
}
