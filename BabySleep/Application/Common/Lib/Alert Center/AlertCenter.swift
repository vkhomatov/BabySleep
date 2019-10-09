//
//  AlertCenter.swift
//  BabySleep
//
//  Created by Денис Львович on 10/10/2019.
//  Copyright © 2019 Денис Львович. All rights reserved.
//

import UIKit

final class AlertCenter {

    /// Замыкание, вызываемое по нажатию на `action`.
    typealias ActionHandler = ((UIAlertAction) -> Void)?
    typealias TextInputActionHandler = ((UITextField) -> Void)?

    // MARK: - Public methods
    func showNotificationAlert(withType type: NotificationAlertType) {
        let title = type.title
        let message = type.message

        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: type.buttonTitle, style: .cancel, handler: nil)
        alert.addAction(action)

        show(alert: alert)
    }

    // MARK: - Private methods
    private func show(alert: UIViewController) {
        if var controller = UIApplication.shared.keyWindow?.rootViewController {
            while let presentedViewController = controller.presentedViewController {
                controller = presentedViewController
            }

            // Убираем возможность показа двойного алерта
            if !(controller is UIAlertController) {
                controller.present(alert,
                                   animated: true,
                                   completion: nil)
            }
        }
    }
}

