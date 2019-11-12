//
//  RegimeCoordinatorFactoryDev.swift
//  BabySleep
//
//  Created by Константин on 06.11.2019.
//  Copyright © 2019 Денис Львович. All rights reserved.
//

final class BSCoordinatorFactoryDev: BSCoordinatorFactory {

    func makeRegimeCoordinator(controllerFactory: ViewControllerFactory,
                               modelFactory: ViewModelFactory) -> RegimeCoordinator {
        return RegimeCoordinator(coordinatorFactory: self,
                                 viewControllerFactory: controllerFactory,
                                 viewModelFactory: modelFactory)
    }
    
    func makeReportCoordinator(controllerFactory: ViewControllerFactory,
                               modelFactory: ViewModelFactory) -> ReportCoordinator {
        return ReportCoordinator(coordinatorFactory: self,
                                 viewControllerFactory: controllerFactory,
                                 viewModelFactory: modelFactory)
    }
    
    func makeTrainingCooordinator(controllerFactory: ViewControllerFactory,
                                  modelFactory: ViewModelFactory) -> TrainingCoordinator {
        return TrainingCoordinator(coordinatorFactory: self,
                                   viewControllerFactory: controllerFactory,
                                   viewModelFactory: modelFactory)
    }
    
    func makeDetailCoordinator(controllerFactory: ViewControllerFactory, modelFactory: ViewModelFactory) -> DetailCoordinator {
        return DetailCoordinator(coordinatorFactory: self,
                                 viewControllerFactory: controllerFactory,
                                 viewModelFactory: modelFactory)
    }
    
}
