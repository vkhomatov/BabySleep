//
//  ReportCoordinator.swift
//  BabySleep
//
//  Created by Константин on 06.11.2019.
//  Copyright © 2019 Денис Львович. All rights reserved.
//

import Foundation
import XCoordinator

enum ReportRoute: Route {
    case list
}

class ReportCoordinator: NavigationCoordinator<ReportRoute> {
    
    private let coordinatorFactory: BSCoordinatorFactory
    private let viewControllerFactory: ViewControllerFactory
    private let viewModelFactory: ViewModelFactory
    
    init(coordinatorFactory: BSCoordinatorFactory,
         viewControllerFactory: ViewControllerFactory,
         viewModelFactory: ViewModelFactory) {
        
        self.coordinatorFactory = coordinatorFactory
        self.viewControllerFactory = viewControllerFactory
        self.viewModelFactory = viewModelFactory
        
        super.init(initialRoute: .list)
    }
    
    override func prepareTransition(for route: ReportRoute) -> NavigationTransition {
        switch route {
        case .list:
            let model = viewModelFactory.makeReportViewModel()
            let vc = viewControllerFactory.makeReportList(router: self.unownedRouter,
                                                          model: model)
            return .push(vc)
        }
    }
        
}
