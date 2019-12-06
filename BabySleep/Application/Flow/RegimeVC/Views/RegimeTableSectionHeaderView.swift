//
//  RegimeTableSectionHeader.swift
//  BabySleep
//
//  Created by Денис Львович on 23/11/2019.
//  Copyright © 2019 Денис Львович. All rights reserved.
//

import UIKit
import PinLayout

class RegimeTableSectionHeader: UIView {

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        self.addSubview(label)

        return label
    }()

    override func layoutSubviews() {
        super.layoutSubviews()

        setTitleLabel(state: .wakefulness, hours: 1, minutes: 30) // TODO: Убрать
        titleLabel.pin.center().sizeToFit()
    }

    func setTitleLabel(state: State, hours: Int, minutes: Int) {

        let numbersFont = UIFont.systemFont(ofSize: 15.0.scaled, weight: .bold)
        let lettersFont = UIFont.systemFont(ofSize: 13.0.scaled, weight: .regular)

        let attributedString = NSMutableAttributedString()

        let stateString = state == .sleep ? "Сон: " : "Бодрствование: "
        let labelComponents = [stateString, String(hours) + " ", "ч ", String(minutes) + " ", "мин"]

        labelComponents.enumerated().forEach {
            let attributes: [NSAttributedString.Key: Any]
            if $0.offset.isEven {
                attributes = [
                    .font: lettersFont,
                    .foregroundColor: UIColor.brownGrey]
            } else {
                attributes = [
                    .font: numbersFont,
                    .foregroundColor: UIColor.black]
            }

            let appendAttributedString = NSAttributedString(string: $0.element, attributes: attributes)
            attributedString.append(appendAttributedString)
        }

        titleLabel.attributedText = attributedString
    }

    enum State {
        case sleep, wakefulness
    }
}
