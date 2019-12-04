//
//  RegistrationCoordinator.swift
//  BabySleep
//
//  Created by Vit on 26.11.2019.
//  Copyright © 2019 Денис Львович. All rights reserved.
//

import Foundation
import XCoordinator

enum RegistrationRoute: Route {
    case pageViewController
}

final class RegistrationCoordinator: NavigationCoordinator<RegistrationRoute> {

    private let coordinatorFactory: CoordinatorFactory
    private let viewControllerFactory: ViewControllerFactory
    private let viewModelFactory: ViewModelFactory
    
    
    // MARK: - Init
    init(coordinatorFactory: CoordinatorFactory,
         viewControllerFactory: ViewControllerFactory,
         viewModelFactory: ViewModelFactory) {

        self.viewControllerFactory = viewControllerFactory
        self.coordinatorFactory = coordinatorFactory
        self.viewModelFactory = viewModelFactory
        
        super.init(initialRoute: .pageViewController)
        

    }

    // MARK: - Overrides
    override func prepareTransition(for route: RegistrationRoute) -> NavigationTransition {

        switch route {

        case .pageViewController:
        let model = viewModelFactory.makePageViewModel()
        let viewController = self.viewControllerFactory
            .makePageViewController(router: self.unownedRouter, model: model)

        return .push(viewController)
        }
        
    }
    
}
