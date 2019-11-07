//
//  RegimeCoordinatorFactory.swift
//  BabySleep
//
//  Created by Константин on 06.11.2019.
//  Copyright © 2019 Денис Львович. All rights reserved.
//f

protocol BSCoordinatorFactory {
    
    func makeRegimeCoordinator(controllerFactory: RegimeViewControllerFactory,
                               modelFactory: RegimeViewModelFactory) -> RegimeCoordinator
    
    func makeReportCoordinator(controllerFactory: ReportViewControllerFactory,
                               modelFactory: ReportViewModelFactory) -> ReportCoordinator
    
    func makeTrainingCooordinator(controllerFactory: TrainingViewControllerFactory,
                                  modelFactory: TrainingViewModelFactory) -> TrainingCoordinator
    
    func makeDetailCoordinator(controllerFactory: DetailViewControllerFactory,
                               modelFactory: DetailViewModelFactory) -> DetailCoordinator
    
}
