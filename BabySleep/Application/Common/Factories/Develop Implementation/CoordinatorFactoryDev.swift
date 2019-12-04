//
//  CoordinatorFactoryDev.swift
//  BabySleep
//
//  Created by Денис Львович on 10/10/2019.
//  Copyright © 2019 Денис Львович. All rights reserved.
//

final class CoordinatorFactoryDev: CoordinatorFactory {
    
      func makeRegistrationCoordinator(controllerFactory: ViewControllerFactory, modelFactory: ViewModelFactory) -> RegistrationCoordinator {
          return RegistrationCoordinator(coordinatorFactory: self,
          viewControllerFactory: controllerFactory,
          viewModelFactory: modelFactory)
      }
    
    func makeNewEdgeCategoryCoordinator(controllerFactory: ViewControllerFactory, modelFactory: ViewModelFactory) -> NewEdgeCategoryCoordinator {
        return NewEdgeCategoryCoordinator(coordinatorFactory: self,
        viewControllerFactory: controllerFactory,
        viewModelFactory: modelFactory)
    }
    
}
