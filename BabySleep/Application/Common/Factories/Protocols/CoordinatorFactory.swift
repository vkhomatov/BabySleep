//
//  CoordinatorFactory.swift
//  BabySleep
//
//  Created by Денис Львович on 10/10/2019.
//  Copyright © 2019 Денис Львович. All rights reserved.
//

protocol CoordinatorFactory {

        
    func makeRegistrationCoordinator(controllerFactory: ViewControllerFactory,
                                     modelFactory: ViewModelFactory) -> RegistrationCoordinator
    
    func makeNewEdgeCategoryCoordinator(controllerFactory: ViewControllerFactory,
                                        modelFactory: ViewModelFactory) -> NewEdgeCategoryCoordinator
    
}
