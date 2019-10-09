//
//  NotificationAlertType.swift
//  BabySleep
//
//  Created by Денис Львович on 10/10/2019.
//  Copyright © 2019 Денис Львович. All rights reserved.
//

import Foundation

/// Тип оповещений. От него зависит `action` алерта.
enum NotificationAlertType {

    /// Ошибка при попытке вытащить данные из базы данных
    case dataAccessError

    var title: String {
        switch self {
        case .dataAccessError:
            return "Error" //.localized
        }
    }

    var message: String {
        switch self {
        case .dataAccessError:
            return "GetDataError" //.localized
        }
    }

    var buttonTitle: String {
        switch self {

        default:
            return "OK" //.localized
        }
    }
}

