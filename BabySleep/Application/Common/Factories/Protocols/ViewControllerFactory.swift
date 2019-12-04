//
//  ViewControllerFactory.swift
//  BabySleep
//
//  Created by Денис Львович on 10/10/2019.
//  Copyright © 2019 Денис Львович. All rights reserved.
//

import XCoordinator

protocol ViewControllerFactory {
    
    
    func makePageViewController(router: UnownedRouter<RegistrationRoute>,
                                model: PageViewModel) -> PageViewController
    
    func makeNewEdgeCategoryViewController(router: UnownedRouter<NewEdgeCategoryRoute>,
                                           model: NewEdgeCategoryModel) -> NewEdgeCategoryViewController
    
}
