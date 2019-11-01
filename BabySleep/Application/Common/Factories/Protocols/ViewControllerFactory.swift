//
//  ViewControllerFactory.swift
//  BabySleep
//
//  Created by Денис Львович on 10/10/2019.
//  Copyright © 2019 Денис Львович. All rights reserved.
//

import XCoordinator

protocol ViewControllerFactory {
    
    func makeViewController(router: UnownedRouter<SampleRoute>,
                            model: ViewModel) -> ViewController

    func makeAnotherViewController(router: UnownedRouter<SampleRoute>,
                                   model: AnotherViewModel) -> AnotherViewController
    
    func makeWalkthroughViewController(router: UnownedRouter<SampleRoute>,
                            model: PageModel) -> WalkthroughViewController
}
