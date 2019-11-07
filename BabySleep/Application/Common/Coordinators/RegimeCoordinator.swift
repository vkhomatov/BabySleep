//
//  RegimeCoordinator.swift
//  BabySleep
//
//  Created by Константин on 06.11.2019.
//  Copyright © 2019 Денис Львович. All rights reserved.
//

import Foundation
import XCoordinator

enum RegimeRoute: Route {
    case sleepList
}

class RegimeCoordinator: NavigationCoordinator<RegimeRoute> {
    
    private let coordinatorFactory: BSCoordinatorFactory
    private let viewControllerFactory: RegimeViewControllerFactory
    private let viewModelFactory: RegimeViewModelFactory
    
    init(coordinatorFactory: BSCoordinatorFactory,
         viewControllerFactory: RegimeViewControllerFactory,
         viewModelFactory: RegimeViewModelFactory) {
        
        self.coordinatorFactory = coordinatorFactory
        self.viewControllerFactory = viewControllerFactory
        self.viewModelFactory = viewModelFactory
        
        super.init(initialRoute: .sleepList)
    }
    
    override func prepareTransition(for route: RegimeRoute) -> NavigationTransition {
        switch route {
        case .sleepList:
            let model = viewModelFactory.makeRegimeListViewModel()
            let vc = viewControllerFactory.makeRegimeList(router: self.unownedRouter,
                                                          model: model)
            return .push(vc)
        }
    }
        
}
