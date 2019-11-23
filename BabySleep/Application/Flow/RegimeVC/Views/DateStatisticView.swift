//
//  DateStatisticView.swift
//  BabySleep
//
//  Created by Денис Львович on 18/11/2019.
//  Copyright © 2019 Денис Львович. All rights reserved.
//

import UIKit

class DateStatisticView: UIView {

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13.0.scaled)
        label.textColor = .white
        label.text = "Общее время сна"

        return label
    }()

    private let daySleepTimeLabel = UILabel()
    private let nightSleepTimeLabel = UILabel()
    private let totalSleepTimeLabel = UILabel()

    override init(frame: CGRect) {

        super.init(frame: frame)
        self.backgroundColor = .mainColor

        self.setupSubviews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        titleLabel.pin.top(18.0.scaled).hCenter().sizeToFit()

        setSleepTime(type: .day)
        setSleepTime(type: .night)
        setSleepTime(type: .total)

        daySleepTimeLabel.pin.bottom(15.0.scaled).left(20.0.scaled).sizeToFit()
        nightSleepTimeLabel.pin.bottom(15.0.scaled).right(20.0.scaled).sizeToFit()
        totalSleepTimeLabel.pin.bottom(15.0.scaled).hCenter().sizeToFit()
    }

    private func setupSubviews() {
        self.addSubview(titleLabel)
        self.addSubview(daySleepTimeLabel)
        self.addSubview(nightSleepTimeLabel)
        self.addSubview(totalSleepTimeLabel)
    }

    func setSleepTime(type: SleepType) {

        let mainString = NSMutableAttributedString()

        let hoursNum = "02 "
        let hoursText = "ч "
        let minutesNum = "00 "
        let minutesText = "мин "

        let numbersSize: CGFloat
        let lettersSize: CGFloat

        func appendAttributedNumString(font: UIFont, text: String) {
            let attributes: [NSAttributedString.Key: Any] = [
                .font: font,
                .foregroundColor: UIColor.white]
            mainString.append(NSAttributedString(string: text, attributes: attributes))
        }

        if type != .total {
            let iconImage = type == .day ? UIImage(named: "day_icon") : UIImage(named: "night_icon")
            let imageAttachment = NSTextAttachment()
            imageAttachment.image = iconImage
            imageAttachment.bounds = CGRect(x: 0.0, y: -4.5.scaled,
                                            width: 18.0.scaled,
                                            height: 18.0.scaled)

            let attachmentString = NSAttributedString(attachment: imageAttachment)
            let spaceString = NSAttributedString(string: " ")
            mainString.append(attachmentString)
            mainString.append(spaceString)
        }

        switch type {
        case .total:
            let numFont = UIFont.systemFont(ofSize: 20.0.scaled, weight: .semibold)
            let lettersFont = UIFont.systemFont(ofSize: 13.0.scaled, weight: .regular)
            let stringParams = [ (font: numFont, text: hoursNum),
                                 (font: lettersFont, text: hoursText),
                                 (font: numFont, text: minutesNum),
                                 (font: lettersFont, text: minutesText)]
            stringParams.forEach { appendAttributedNumString(font: $0.font, text: $0.text) }

            totalSleepTimeLabel.attributedText = mainString

        case .day:
            let numFont = UIFont.systemFont(ofSize: 13.0.scaled, weight: .semibold)
            let lettersFont = UIFont.systemFont(ofSize: 11.0.scaled, weight: .regular)
            let stringParams = [ (font: numFont, text: hoursNum),
                                 (font: lettersFont, text: hoursText),
                                 (font: numFont, text: minutesNum),
                                 (font: lettersFont, text: minutesText)]
            stringParams.forEach { appendAttributedNumString(font: $0.font, text: $0.text) }

            daySleepTimeLabel.attributedText = mainString

        case .night:
            let numFont = UIFont.systemFont(ofSize: 13.0.scaled, weight: .semibold)
            let lettersFont = UIFont.systemFont(ofSize: 11.0.scaled, weight: .regular)
            let stringParams = [ (font: numFont, text: hoursNum),
                                 (font: lettersFont, text: hoursText),
                                 (font: numFont, text: minutesNum),
                                 (font: lettersFont, text: minutesText)]
            stringParams.forEach { appendAttributedNumString(font: $0.font, text: $0.text) }

            nightSleepTimeLabel.attributedText = mainString
        }
    }

    enum SleepType {
        case day, night, total
    }
}
