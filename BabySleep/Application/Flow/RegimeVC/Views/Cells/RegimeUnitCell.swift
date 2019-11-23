//
//  RegimeUnitCell.swift
//  BabySleep
//
//  Created by Денис Львович on 18/11/2019.
//  Copyright © 2019 Денис Львович. All rights reserved.
//

import UIKit
import PinLayout

class RegimeUnitCell: UITableViewCell {

    let iconImage = UIImageView(image: UIImage(named: "day_icon_cell"))

    private lazy var sleepType: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15.0.scaled)
        label.textColor = .sea
        label.text = "Дневной сон"

        return label
    }()

    private var duration = UILabel()

    private lazy var comment: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 11.0.scaled)
        label.textColor = .brownGrey
        label.text = "По пути на дачу"

        return label

    }()

    private lazy var period: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 11.0.scaled)
        label.textColor = .brownGrey
        label.text = "10:30–13:20"

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

        iconImage.pin.width(26.0.scaled).height(26.0.scaled)
            .top(9.0.scaled)
            .left(25.0.scaled)

        sleepType.pin.after(of: iconImage, aligned: .top)
            .marginLeft(16.0.scaled)
            .sizeToFit()

        duration.pin.below(of: sleepType, aligned: .left)
            .marginTop(4.0.scaled)
            .sizeToFit()

        comment.pin.below(of: duration, aligned: .left)
            .marginTop(3.0.scaled)
            .sizeToFit()

        period.pin.top(12.0.scaled).right(18.0.scaled)
            .sizeToFit()

        cellTopSeparator.pin.top(-0.75).width(of: self.contentView).height(1.5)

        cellBottomSeparator.pin.bottom(-0.75).width(of: self.contentView).height(1.5)
    }

    private func configureSubviews() {
        self.contentView.addSubview(iconImage)
        self.contentView.addSubview(sleepType)
        self.contentView.addSubview(duration)
        self.contentView.addSubview(comment)
        self.contentView.addSubview(period)

        self.preservesSuperviewLayoutMargins = false
        self.separatorInset = .zero
        self.layoutMargins = .zero

        // TODO: Убрать
        setDurationLabel(time: "02 ч 00 мин")
    }

    func setDurationLabel(time: String) {

        let numbersFont = UIFont.systemFont(ofSize: 15.0.scaled, weight: .semibold)
        let numbersAttributes: [NSAttributedString.Key: Any] = [
            .font: numbersFont,
            .foregroundColor: UIColor.black]

        let lettersFont = UIFont.systemFont(ofSize: 11.0.scaled, weight: .regular)
        let lettersAttributes: [NSAttributedString.Key: Any] = [
            .font: lettersFont,
            .foregroundColor: UIColor.brownGrey]

        let attributedString = NSMutableAttributedString(string: time,
                                                  attributes: numbersAttributes)

        attributedString.addAttributes(lettersAttributes,
                                       range: NSRange(location: 3, length: 1))
        attributedString.addAttributes(lettersAttributes,
                                       range: NSRange(location: 8, length: 3))

        duration.attributedText = attributedString
    }
}
