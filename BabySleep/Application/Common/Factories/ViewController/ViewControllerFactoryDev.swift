//
//  ViewControllerFactoryDev.swift
//  BabySleep
//
//  Created by Константин on 11.11.2019.
//  Copyright © 2019 Денис Львович. All rights reserved.
//

import XCoordinator

final class ViewControllerFactoryDev: ViewControllerFactory {

    func makeOptionTable(router: UnownedRouter<DetailRoute>,
                         model: DetailViewModel) -> DetailViewController {
        return DetailViewController(route: router, model: model)
    }
    
    func makeReportList(router: UnownedRouter<ReportRoute>,
                        model: ReportViewModel) -> ReportViewController {
        return ReportViewController(model: model, router: router)
    }
    
    func makeTrainingViewController(router: UnownedRouter<TrainingRoute>,
                                    model: TrainingViewModel) -> TrainingViewController {
        return TrainingViewController(route: router, model: model)
    }
    
    func makeRegimeList(router: UnownedRouter<RegimeRoute>,
                        model: RegimeListViewModel) -> RegimeListViewController {
        return RegimeListViewController(model: model, router: router)
    }
    
    
}
