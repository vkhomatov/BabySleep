//
//  CurrentStateCell.swift
//  BabySleep
//
//  Created by Денис Львович on 22/11/2019.
//  Copyright © 2019 Денис Львович. All rights reserved.
//

import UIKit

class CurrentStateCell: UITableViewCell {

    private lazy var state: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15.0.scaled, weight: .regular)
        label.textColor = .sea
        label.text = "Бодрствует"

        return label
    }()

    private lazy var duration: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17.0.scaled, weight: .semibold)
        label.textColor = .sea
        label.text = "03:00:02"

        return label

    }()

    private lazy var cellTopSeparator: UIView = {
        let separator = UIView()
        separator.backgroundColor = .ice
        self.addSubview(separator)

        return separator
    }()

    private lazy var cellBottomSeparator: UIView = {
        let separator = UIView()
        separator.backgroundColor = .ice
        self.addSubview(separator)

        return separator
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configureSubviews()

        self.selectionStyle = .none
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        state.pin.top(20.0.scaled)
            .hCenter()
            .sizeToFit()

        duration.pin.below(of: state, aligned: .center)
            .marginTop(3.0.scaled)
            .sizeToFit()

        cellTopSeparator.pin.top(-0.75).width(of: self.contentView).height(1.5)

        cellBottomSeparator.pin.bottom(-0.75).width(of: self.contentView).height(1.5)
    }

    private func configureSubviews() {
        self.contentView.addSubview(state)
        self.contentView.addSubview(duration)

        self.preservesSuperviewLayoutMargins = false
        self.separatorInset = .zero
        self.layoutMargins = .zero
    }
}
