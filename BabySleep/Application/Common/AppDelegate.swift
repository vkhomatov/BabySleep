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
    
    private var userD = UserDefaultsOperation()
    
    let router1 = RegistrationCoordinator(coordinatorFactory: CoordinatorFactoryDev(),
    viewControllerFactory: ViewControllerFactoryDev(),
    viewModelFactory: ViewModelFactoryDev()).strongRouter
    
    let router2 = NewEdgeCategoryCoordinator(coordinatorFactory: CoordinatorFactoryDev(),
    viewControllerFactory: ViewControllerFactoryDev(),
    viewModelFactory: ViewModelFactoryDev()).strongRouter
    

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        
        if  userD.childRecord ?? false {
            print("Запись UserDefaults есть")
                     
            print(userD.childNameRead ?? "Не удалось прочитать имя")
            print(userD.childDOBRead ?? "Не удалось прочитать дату")
            print(userD.childGenderRead ?? "Не удалось прочитать пол")
            
            router2.setRoot(for: window)

        } else {
            print("Записи UserDefaults нет")
            
            router1.setRoot(for: window)


        }

       // router.setRoot(for: window)
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
        YMMYandexMetrica.activate(with: configuration)
    }
}
