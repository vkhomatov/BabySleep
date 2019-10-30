//
//  ExceptionHandlingHelper.swift
//  BabySleep
//
//  Created by Андрей Понамарчук on 26.10.2019.
//  Copyright © 2019 Денис Львович. All rights reserved.
//

import YandexMobileMetrica
import Crashlytics
import FirebaseAnalytics

final class ExceptionHandlingHelper {
    static func reportError(message: String, excerption: NSException?) {
        assertionFailure(message)
        YMMYandexMetrica.reportError(message, exception: excerption, onFailure: nil)
        CLSLogv("%@", getVaList([message]))
    }
    static func logEvent(event: String, title: String, content: String) {
        assertionFailure(content);
        let parameters = [AnalyticsParameterItemID: "id-\(title)", AnalyticsParameterItemName: title, AnalyticsParameterContent: content]
        
        Analytics.logEvent(event, parameters: parameters)
        YMMYandexMetrica.reportEvent(event, parameters: parameters, onFailure: nil)
    }
}
