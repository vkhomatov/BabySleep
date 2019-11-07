//
//  DetailViewControllerFactoryDev.swift
//  BabySleep
//
//  Created by Константин on 06.11.2019.
//  Copyright © 2019 Денис Львович. All rights reserved.
//

import XCoordinator

final class DetailViewControllerFactoryDev: DetailViewControllerFactory {
    
    func makeOptionTable(router: UnownedRouter<DetailRoute>,
                         model: DetailViewModel) -> DetailViewController {
        return DetailViewController(route: router, model: model)
    }
    
}
