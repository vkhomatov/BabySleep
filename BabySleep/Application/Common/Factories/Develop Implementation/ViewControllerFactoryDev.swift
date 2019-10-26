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

    func makeViewController(router: UnownedRouter<SampleRoute>,
                            model: ViewModel) -> ViewController {
        return ViewController(model: model,
                              router: router)
    }

    func makeAnotherViewController(router: UnownedRouter<SampleRoute>,
                                   model: AnotherViewModel) -> AnotherViewController {

        return AnotherViewController(model: model,
                                     router: router)
    }
    
    func makePageController(router: UnownedRouter<SampleRoute>,
                            model: PageModel) -> PageController {
        return PageController(model: model, router: router)
    }
}
