//
//  CalendarSwitcherView.swift
//  BabySleep
//
//  Created by Денис Львович on 18/11/2019.
//  Copyright © 2019 Денис Львович. All rights reserved.
//

import UIKit
import PinLayout

class CalendarSwitcherView: UIView {

    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProText-Regular", size: 17.0.scaled)
        label.textColor = .black

        return label
    }()

    lazy var switchLeftButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "left_arrow"), for: .normal)
        button.addTarget(self, action: #selector(self.switchDateBack), for: .touchUpInside)

        return button
    }()

    lazy var switchRightButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "right_arrow"), for: .normal)
        button.addTarget(self, action: #selector(self.switchDateForward), for: .touchUpInside)

        return button
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

        dateLabel.text = "22 октября"

        dateLabel.pin.center().sizeToFit()
        switchLeftButton.pin.left().vCenter().height(of: self).width(15%)
        switchRightButton.pin.right().vCenter().height(of: self).width(15%)
    }

    private func setupSubviews() {
        self.addSubview(dateLabel)
        self.addSubview(switchLeftButton)
        self.addSubview(switchRightButton)
    }

    @objc private func switchDateBack() {
        print("switch back")
    }

    @objc private func switchDateForward() {
        print("switch forward")
    }
}
