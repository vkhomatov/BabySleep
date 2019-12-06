//
//  Sleep.swift
//  BabySleep
//
//  Created by Денис Львович on 11/11/2019.
//  Copyright © 2019 Денис Львович. All rights reserved.
//

import Foundation

protocol Sleep: Identifiable {

    /// Уникальный идентификатор, строка, primary key
    var id: String {get set}

    /// Время начала сна
    var startSleepTime: Date {get set}

    /// Время окончания сна
    var endSleepTime: Date? {get set}

    /// Переменная, показывающая завершился ли сон
    var isEnded: Bool { get }

    /// Текстовый комментарий
    var comment: String {get set}
}
