//
//  RegimeCoordinatorFactory.swift
//  BabySleep
//
//  Created by Константин on 06.11.2019.
//  Copyright © 2019 Денис Львович. All rights reserved.
//f

protocol BSCoordinatorFactory {
    
    func makeRegimeCoordinator(controllerFactory: ViewControllerFactory,
                               modelFactory: ViewModelFactory) -> RegimeCoordinator
    
    func makeReportCoordinator(controllerFactory: ViewControllerFactory,
                               modelFactory: ViewModelFactory) -> ReportCoordinator
    
    func makeTrainingCooordinator(controllerFactory: ViewControllerFactory,
                                  modelFactory: ViewModelFactory) -> TrainingCoordinator
    
    func makeDetailCoordinator(controllerFactory: ViewControllerFactory,
                               modelFactory: ViewModelFactory) -> DetailCoordinator
    
}
