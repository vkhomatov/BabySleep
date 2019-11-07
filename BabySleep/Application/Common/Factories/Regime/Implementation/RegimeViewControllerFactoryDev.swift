//
//  RegimeViewControllerFactoryDev.swift
//  BabySleep
//
//  Created by Константин on 06.11.2019.
//  Copyright © 2019 Денис Львович. All rights reserved.
//

import XCoordinator

final class RegimeViewControllerFactoryDev: RegimeViewControllerFactory {

    func makeRegimeList(router: UnownedRouter<RegimeRoute>,
                        model: RegimeListViewModel) -> RegimeListViewController {
        return RegimeListViewController(model: model, router: router)
    }
    
}
