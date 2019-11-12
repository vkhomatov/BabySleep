//
//  RegimeViewController.swift
//  BabySleep
//
//  Created by Константин on 06.11.2019.
//  Copyright © 2019 Денис Львович. All rights reserved.
//

import UIKit
import XCoordinator

class RegimeListViewController: UIViewController {
    
    private let model: RegimeListViewModel
    private let router: UnownedRouter<RegimeRoute>

    init(model: RegimeListViewModel, router: UnownedRouter<RegimeRoute>) {
        self.model = model
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        
    }
    
    
}
