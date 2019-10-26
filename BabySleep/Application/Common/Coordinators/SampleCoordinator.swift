//
//  SampleCoordinator.swift
//  BabySleep
//
//  Created by Денис Львович on 10/10/2019.
//  Copyright © 2019 Денис Львович. All rights reserved.
//

import Foundation
import XCoordinator

enum SampleRoute: Route {
    case viewController
    case anotherViewController
    case pageController
}

final class SampleCoordinator: NavigationCoordinator<SampleRoute> {

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

        super.init(initialRoute: .viewController)
    }

    // MARK: - Overrides
    override func prepareTransition(for route: SampleRoute) -> NavigationTransition {

        switch route {

        case .viewController:
            let model = viewModelFactory.makeViewModel()
            let viewController = self.viewControllerFactory
                .makeViewController(router: self.unownedRouter, model: model)

            return .push(viewController)

        case .anotherViewController:
            let model = viewModelFactory.makeAnotherViewModel()
            let viewController = self.viewControllerFactory
                .makeAnotherViewController(router: self.unownedRouter, model: model)

            return .push(viewController)
            
        case .pageController:
            let model = viewModelFactory.makePageModel()
            let viewController = self.viewControllerFactory
                .makePageController(router: self.unownedRouter, model: model)
            return .push(viewController)
        }
    }
}
