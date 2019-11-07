//
//  TrainingViewControllerFactoryDev.swift
//  BabySleep
//
//  Created by Константин on 06.11.2019.
//  Copyright © 2019 Денис Львович. All rights reserved.
//

import XCoordinator

class TrainingViewControllerFactoryDev: TrainingViewControllerFactory {
    
    func makeTrainingViewController(router: UnownedRouter<TrainingRoute>,
                                    model: TrainingViewModel) -> TrainingViewController {
        return TrainingViewController(route: router, model: model)
    }
    
    
}
