//
//  ExceptionHandlingHelper.swift
//  BabySleep
//
//  Created by Андрей Понамарчук on 26.10.2019.
//  Copyright © 2019 Денис Львович. All rights reserved.
//

import YandexMobileMetrica
import Crashlytics

final class ExceptionHandlingHelper {
    static func reportError(message: String, excerption: NSException?) {
        assertionFailure(message)
        YMMYandexMetrica.reportError(message, exception: excerption, onFailure: nil)
        CLSLogv("%@", getVaList([message]))
    }
}
