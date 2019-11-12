//
//  ReportViewController.swift
//  BabySleep
//
//  Created by Константин on 06.11.2019.
//  Copyright © 2019 Денис Львович. All rights reserved.
//

import UIKit
import XCoordinator

class ReportViewController: UIViewController {
    
    private let model: ReportViewModel
    private let router: UnownedRouter<ReportRoute>

    init(model: ReportViewModel, router: UnownedRouter<ReportRoute>) {
        self.model = model
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        
    }
    
}
