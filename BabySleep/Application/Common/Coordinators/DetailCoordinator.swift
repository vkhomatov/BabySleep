//
//  DetailCoordinator.swift
//  BabySleep
//
//  Created by Константин on 06.11.2019.
//  Copyright © 2019 Денис Львович. All rights reserved.
//

import XCoordinator

enum DetailRoute: Route {
    case detailTable
}

class DetailCoordinator: NavigationCoordinator<DetailRoute> {
        
    private let coordinatorFactory: BSCoordinatorFactory
    private let viewControllerFactory: DetailViewControllerFactory
    private let viewModelFactory: DetailViewModelFactory
    
    init(coordinatorFactory: BSCoordinatorFactory,
         viewControllerFactory: DetailViewControllerFactory,
         viewModelFactory: DetailViewModelFactory) {
        
        self.coordinatorFactory = coordinatorFactory
        self.viewControllerFactory = viewControllerFactory
        self.viewModelFactory = viewModelFactory
        
        super.init(initialRoute: .detailTable)
    }
    
    override func prepareTransition(for route: DetailRoute) -> NavigationTransition {
        switch route {
        case .detailTable:
            let model = viewModelFactory.makeDetailTableViewModel()
            let vc = viewControllerFactory.makeOptionTable(router: self.unownedRouter,
                                                           model: model)
            return .push(vc)
        }
    }
    
}
