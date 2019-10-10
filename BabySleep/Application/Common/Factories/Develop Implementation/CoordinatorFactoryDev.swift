//
//  CoordinatorFactoryDev.swift
//  BabySleep
//
//  Created by Денис Львович on 10/10/2019.
//  Copyright © 2019 Денис Львович. All rights reserved.
//

final class CoordinatorFactoryDev: CoordinatorFactory {
    
    func makeSampleCoordinator(controllerFactory: ViewControllerFactory,
                               modelFactory: ViewModelFactory) -> SampleCoordinator {
        return SampleCoordinator(coordinatorFactory: self,
                                 viewControllerFactory: controllerFactory,
                                 viewModelFactory: modelFactory)
    }
}
