//
//  ReportViewControllerFactory.swift
//  BabySleep
//
//  Created by Константин on 06.11.2019.
//  Copyright © 2019 Денис Львович. All rights reserved.
//

import XCoordinator

protocol ReportViewControllerFactory {
    
    func makeReportList(router: UnownedRouter<ReportRoute>,
                        model: ReportViewModel) -> ReportViewController
    
}
