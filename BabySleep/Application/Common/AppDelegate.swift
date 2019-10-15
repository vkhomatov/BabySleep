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

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let router = SampleCoordinator(coordinatorFactory: CoordinatorFactoryDev(),
                                   viewControllerFactory: ViewControllerFactoryDev(),
                                   viewModelFactory: ViewModelFactoryDev()).strongRouter

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window

        router.setRoot(for: window)
        window.makeKeyAndVisible()
        
        return true
    }
    
    private func metricsConfig() {
        FirebaseApp.configure()
    }
}
