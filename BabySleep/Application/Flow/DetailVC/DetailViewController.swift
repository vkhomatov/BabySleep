//
//  DetailViewController.swift
//  BabySleep
//
//  Created by Константин on 06.11.2019.
//  Copyright © 2019 Денис Львович. All rights reserved.
//

import UIKit
import XCoordinator

class DetailViewController: UIViewController {
    
    let route: UnownedRouter<DetailRoute>
    let model: DetailViewModel

    
    init(route: UnownedRouter<DetailRoute>, model: DetailViewModel) {
        self.route = route
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
    }
    
}
