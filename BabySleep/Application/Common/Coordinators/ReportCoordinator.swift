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
    private let viewControllerFactory: ReportViewControllerFactory
    private let viewModelFactory: ReportViewModelFactory
    
    init(coordinatorFactory: BSCoordinatorFactory,
         viewControllerFactory: ReportViewControllerFactory,
         viewModelFactory: ReportViewModelFactory) {
        
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
