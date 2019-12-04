//
//  NewEdgeCategoryCoordinator.swift
//  BabySleep
//
//  Created by Vit on 03.12.2019.
//  Copyright © 2019 Денис Львович. All rights reserved.
//

import Foundation
import XCoordinator

enum NewEdgeCategoryRoute: Route {
    case newEdgeCategoryViewController
}

final class NewEdgeCategoryCoordinator: NavigationCoordinator<NewEdgeCategoryRoute> {

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
        
        super.init(initialRoute: .newEdgeCategoryViewController)
        

    }

    // MARK: - Overrides
    override func prepareTransition(for route: NewEdgeCategoryRoute) -> NavigationTransition {

        switch route {

        case .newEdgeCategoryViewController:
        let model = viewModelFactory.makeNewEdgeCategoryModel()
        let viewController = self.viewControllerFactory
            .makeNewEdgeCategoryViewController(router: self.unownedRouter, model: model)

        return .push(viewController)
        }
        
    }
    
}
