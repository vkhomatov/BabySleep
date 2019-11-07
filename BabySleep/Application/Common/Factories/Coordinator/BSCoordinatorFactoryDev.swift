//
//  RegimeCoordinatorFactoryDev.swift
//  BabySleep
//
//  Created by Константин on 06.11.2019.
//  Copyright © 2019 Денис Львович. All rights reserved.
//

final class BSCoordinatorFactoryDev: BSCoordinatorFactory {

    func makeRegimeCoordinator(controllerFactory: RegimeViewControllerFactory,
                               modelFactory: RegimeViewModelFactory) -> RegimeCoordinator {
        return RegimeCoordinator(coordinatorFactory: self,
                                 viewControllerFactory: controllerFactory,
                                 viewModelFactory: modelFactory)
    }
    
    func makeReportCoordinator(controllerFactory: ReportViewControllerFactory,
                               modelFactory: ReportViewModelFactory) -> ReportCoordinator {
        return ReportCoordinator(coordinatorFactory: self,
                                 viewControllerFactory: controllerFactory,
                                 viewModelFactory: modelFactory)
    }
    
    func makeTrainingCooordinator(controllerFactory: TrainingViewControllerFactory,
                                  modelFactory: TrainingViewModelFactory) -> TrainingCoordinator {
        return TrainingCoordinator(coordinatorFactory: self,
                                   viewControllerFactory: controllerFactory,
                                   viewModelFactory: modelFactory)
    }
    
    func makeDetailCoordinator(controllerFactory: DetailViewControllerFactory, modelFactory: DetailViewModelFactory) -> DetailCoordinator {
        return DetailCoordinator(coordinatorFactory: self,
                                 viewControllerFactory: controllerFactory,
                                 viewModelFactory: modelFactory)
    }
    
}
