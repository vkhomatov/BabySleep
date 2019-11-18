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

    private lazy var mainView: RegimeView = {
        let rect = self.view.frame
        return RegimeView(frame: rect)
    }()

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

        setupViews()
    }


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    private func setupViews() {

        self.view = mainView
        self.mainView.tableView.register(RegimeUnitCell.self, forCellReuseIdentifier: "regimeCell")
    }
}
