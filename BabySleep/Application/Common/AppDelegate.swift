//
//  AppDelegate.swift
//  BabySleep
//
//  Created by Денис Львович on 09/10/2019.
//  Copyright © 2019 Денис Львович. All rights reserved.
//

import UIKit
import XCoordinator
import Firebase
import YandexMobileMetrica

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let router = SampleCoordinator(coordinatorFactory: CoordinatorFactoryDev(),
                                   viewControllerFactory: ViewControllerFactoryDev(),
                                   viewModelFactory: ViewModelFactoryDev()).strongRouter
    
    let tabBarRouter = BSTabBarCoordinator()

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window

        tabBarRouter.setRoot(for: window)
        window.makeKeyAndVisible()
        
        return true
    }
    
    private func metricsConfig() {
        FirebaseApp.configure()
        
        // Initializing the AppMetrica SDK.
        guard let configuration
            = YMMYandexMetricaConfiguration.init(apiKey: "c1f09291-d43f-414f-b0a6-6e46ca6eb74f") else {
                
                //TODO: Обработать ошибку подключения метрики
                return
        }
        configuration.logs = true
        YMMYandexMetrica.activate(with: configuration)
    }
}
