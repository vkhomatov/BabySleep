//
//  TrainingCoordinator.swift
//  BabySleep
//
//  Created by Константин on 06.11.2019.
//  Copyright © 2019 Денис Львович. All rights reserved.
//

import Foundation
import XCoordinator

enum TrainingRoute: Route {
    case training
}

final class TrainingCoordinator: NavigationCoordinator<TrainingRoute> {
    
    private let coordinatorFactory: BSCoordinatorFactory
    private let viewControllerFactory: TrainingViewControllerFactory
    private let viewModelFactory: TrainingViewModelFactory
    
    init(coordinatorFactory: BSCoordinatorFactory,
         viewControllerFactory: TrainingViewControllerFactory,
         viewModelFactory: TrainingViewModelFactory) {
        
        self.coordinatorFactory = coordinatorFactory
        self.viewControllerFactory = viewControllerFactory
        self.viewModelFactory = viewModelFactory
        
        super.init(initialRoute: .training)
    }
    
    override func prepareTransition(for route: TrainingRoute) -> NavigationTransition {
        switch route {
        case .training:
            let model = viewModelFactory.makeTrainingViewModel()
            let vc = viewControllerFactory.makeTrainingViewController(router: self.unownedRouter,
                                                          model: model)
            return .push(vc)
        }
    }
    
}
