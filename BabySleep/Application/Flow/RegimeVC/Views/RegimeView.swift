//
//  RegimeView.swift
//  BabySleep
//
//  Created by Денис Львович on 17/11/2019.
//  Copyright © 2019 Денис Львович. All rights reserved.
//

import UIKit
import PinLayout

class RegimeView: UIView {

    lazy var dateSwitchView: CalendarSwitcherView = {
        let frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.size.width, height: 46.0.scaled)
        let view = CalendarSwitcherView(frame: frame)

        return view
    }()

    lazy var statisticView: DateStatisticView = {
        let frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.size.width, height: 87.0.scaled)
        let view = DateStatisticView(frame: frame)

        return view
    }()

    lazy var tableView: RegimeTableView = {
        return RegimeTableView()
    }()

    private lazy var sleepButton: UIButton = {
        let sleepButton = UIButton(frame: .zero)

        sleepButton.setTitle("Заснул", for: .normal)
        sleepButton.backgroundColor = .dustyTeal
        sleepButton.titleLabel?.font = UIFont.systemFont(ofSize: 17.0.scaled, weight: .semibold)
        sleepButton.titleLabel?.textColor = .white

        sleepButton.addTarget(self, action: #selector(self.sleepButtonPressed), for: .touchUpInside)

        return sleepButton
    }()

    override init(frame: CGRect) {

        super.init(frame: frame)

        self.backgroundColor = .white
        self.setupSubviews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        dateSwitchView.pin.top(pin.safeArea).horizontally()
        statisticView.pin.below(of: dateSwitchView, aligned: .left).width(of: dateSwitchView)
        sleepButton.pin.bottom(pin.safeArea).horizontally().height(50.0.scaled)
        tableView.pin.below(of: statisticView, aligned: .left).above(of: sleepButton).left().right()
    }

    private func setupSubviews() {
        self.addSubview(dateSwitchView)
        self.addSubview(statisticView)
        self.addSubview(tableView)
        self.addSubview(sleepButton)
    }

    @objc private func sleepButtonPressed() {
    }
}
