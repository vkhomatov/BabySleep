//
//  ViewControllerFactory.swift
//  BabySleep
//
//  Created by Константин on 11.11.2019.
//  Copyright © 2019 Денис Львович. All rights reserved.
//

import XCoordinator

protocol ViewControllerFactory {
    
    func makeOptionTable(router: UnownedRouter<DetailRoute>,
                         model: DetailViewModel) -> DetailViewController
    
    func makeRegimeList(router: UnownedRouter<RegimeRoute>,
                        model: RegimeListViewModel) -> RegimeListViewController
    
    func makeReportList(router: UnownedRouter<ReportRoute>,
                        model: ReportViewModel) -> ReportViewController
    
    func makeTrainingViewController(router: UnownedRouter<TrainingRoute>,
                                    model: TrainingViewModel) -> TrainingViewController
    
    
}
