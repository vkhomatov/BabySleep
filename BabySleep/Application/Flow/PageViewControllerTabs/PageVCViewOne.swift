//
//  PageVCViewOne.swift
//  BabySleep
//
//  Created by Vit on 13.11.2019.
//  Copyright © 2019 Денис Львович. All rights reserved.
//

import UIKit
import PinLayout


class PageVCViewOne: UIView {


    var text1 = String()
    var text2 = String()
    
    let fontName = "SFProText-Semibold"
    let timerImageName = "timer"

        
    lazy var text1Label: UILabel = {
        
        let text1Label = UILabel(frame: .zero)
        text1Label.text = text1
        text1Label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        text1Label.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        text1Label.font = UIFont(name: fontName, size: 17)
        text1Label.numberOfLines = 0
        text1Label.lineBreakMode = .byWordWrapping
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.18
        text1Label.attributedText = NSMutableAttributedString(string: text1, attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        text1Label.textAlignment = NSTextAlignment.center

        return text1Label

    }()
    

    lazy var text2Label: UILabel = {
           
        let text2Label = UILabel(frame: .zero)
        text2Label.text = text2
        text2Label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        text2Label.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        text2Label.font = UIFont(name: fontName, size: 17)
        text2Label.numberOfLines = 0
        text2Label.lineBreakMode = .byWordWrapping
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.18
        text2Label.attributedText = NSMutableAttributedString(string: text2, attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        text2Label.textAlignment = NSTextAlignment.center
           
        return text2Label

    }()
    
    lazy var timerImage: UIImageView = {
     
        let timerImage = UIImageView(frame: .zero)
        timerImage.image = UIImage(named: timerImageName)
     
        return timerImage
    }()
    
    
    override init(frame: CGRect) {

        super.init(frame: frame)

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubviews(text1: String, text2: String) {
        
        self.text1 = text1
        self.text2 = text2
                
        self.view.addSubview(text1Label)
        self.view.addSubview(text2Label)
        view.addSubview(timerImage)

    }
    
    
    func layoutViews() {
    
        text1Label.pin
        .top(300)
        .width(view.frame.size.width - 60)
        .height(117.0)
        .hCenter(0)
        
        text2Label.pin
        .top(550)
        .width(view.frame.size.width - 60)
        .height(90.0)
        .hCenter(0)
        
        timerImage.pin
        .top(500)
        .height(70)
        .aspectRatio()
        .hCenter(0)
     
    }
    
}
