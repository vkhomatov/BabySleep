//
//  ViewControllerFactoryDev.swift
//  BabySleep
//
//  Created by Денис Львович on 10/10/2019.
//  Copyright © 2019 Денис Львович. All rights reserved.
//

import XCoordinator

final class ViewControllerFactoryDev: ViewControllerFactory {
    
   
    let viewModelFactory = ViewModelFactoryDev()
    
    func makePageViewController(router: UnownedRouter<RegistrationRoute>, model: PageViewModel) -> PageViewController {
            return PageViewController(model: model,
            router: router)
       }
    
    func makeNewEdgeCategoryViewController(router: UnownedRouter<NewEdgeCategoryRoute>, model: NewEdgeCategoryModel) -> NewEdgeCategoryViewController {
         return NewEdgeCategoryViewController(model: model,
         router: router)
    }
    
    
}
