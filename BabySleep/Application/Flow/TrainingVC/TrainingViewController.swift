//
//  TrainingViewController.swift
//  BabySleep
//
//  Created by Константин on 06.11.2019.
//  Copyright © 2019 Денис Львович. All rights reserved.
//

import UIKit
import XCoordinator

class TrainingViewController: UIViewController {
    
    let route: UnownedRouter<TrainingRoute>
    let model: TrainingViewModel

    
    init(route: UnownedRouter<TrainingRoute>, model: TrainingViewModel) {
        self.route = route
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        
    }
    
}
