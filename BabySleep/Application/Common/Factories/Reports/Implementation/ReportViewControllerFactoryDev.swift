//
//  ReportViewControllerFactoryDev.swift
//  BabySleep
//
//  Created by Константин on 06.11.2019.
//  Copyright © 2019 Денис Львович. All rights reserved.
//

import XCoordinator

final class ReportViewControllerFactoryDev: ReportViewControllerFactory {
    
    func makeReportList(router: UnownedRouter<ReportRoute>,
                        model: ReportViewModel) -> ReportViewController {
        return ReportViewController(model: model, router: router)
    }
    
}
