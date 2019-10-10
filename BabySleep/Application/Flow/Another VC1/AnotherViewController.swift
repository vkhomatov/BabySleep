//
//  AnotherViewController.swift
//  BabySleep
//
//  Created by Денис Львович on 10/10/2019.
//  Copyright © 2019 Денис Львович. All rights reserved.
//

import UIKit
import XCoordinator

class AnotherViewController: UIViewController {

    private let model: AnotherViewModel
    private let router: UnownedRouter<SampleRoute>

    init(model: AnotherViewModel, router: UnownedRouter<SampleRoute>) {
        self.model = model
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }

    convenience required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .green
    }
}
