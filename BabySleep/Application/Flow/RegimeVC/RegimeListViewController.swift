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
        setupDelegates()
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
        self.mainView.tableView.register(CurrentStateCell.self, forCellReuseIdentifier: "stateCell")
    }

    private func setupDelegates() {
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
    }
}

extension RegimeListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {

        return section == 0 ? 1 : 2
    }

    func tableView(_ tableView: UITableView,
                   viewForHeaderInSection section: Int) -> UIView? {

        if section > 0 {
            return RegimeTableSectionHeader()
        }

        return nil
    }

    func tableView(_ tableView: UITableView,
                   heightForHeaderInSection section: Int) -> CGFloat {

        if section > 0 {
            return 42.0.scaled
        }

        return 0.0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell: UITableViewCell

        switch (indexPath.row, indexPath.section) {
        case (0, 0):
            cell = setupCurrentStateCellView(indexPath: indexPath)
        default:
            cell = setupRegimeUnitView(indexPath: indexPath)
        }

        return cell
    }

    private func setupRegimeUnitView(indexPath: IndexPath) -> RegimeUnitCell {
        guard let cell = self.mainView.tableView
            .dequeueReusableCell(withIdentifier: "regimeCell",
                                 for: indexPath) as? RegimeUnitCell else {

                                    assertionFailure()
                                    return RegimeUnitCell()
        }

        return cell
    }

    private func setupCurrentStateCellView(indexPath: IndexPath) -> CurrentStateCell {
        guard let cell = self.mainView.tableView
            .dequeueReusableCell(withIdentifier: "stateCell",
                                 for: indexPath) as? CurrentStateCell else {

                                    assertionFailure()
                                    return CurrentStateCell()
        }

        return cell
    }
}

extension RegimeListViewController: UITableViewDelegate {
}
