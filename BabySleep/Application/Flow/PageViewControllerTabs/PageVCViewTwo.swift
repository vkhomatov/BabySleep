//
//  PageVCViewTwo.swift
//  BabySleep
//
//  Created by Vit on 13.11.2019.
//  Copyright © 2019 Денис Львович. All rights reserved.
//

import UIKit

class PageVCViewTwo: UIView {
    
    var text3 = String()
    var text4 = String()
    
    let fontName = "SFProText-Semibold"
    let timerImageName = "timer"

    
    lazy var text3Label: UILabel = {
        
        let text3Label = UILabel(frame: .zero)
        text3Label.text = text3
        text3Label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        text3Label.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        text3Label.font = UIFont(name: fontName, size: 17)
        text3Label.numberOfLines = 0
        text3Label.lineBreakMode = .byWordWrapping
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.18
        text3Label.attributedText = NSMutableAttributedString(string: text3, attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        text3Label.textAlignment = NSTextAlignment.center
        
        return text3Label

    }()
    

     lazy var text4Label: UILabel = {
           
           let text4Label = UILabel(frame: .zero)
           text4Label.text = text4
           text4Label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
           text4Label.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
           text4Label.font = UIFont(name: fontName, size: 17)
           text4Label.numberOfLines = 0
           text4Label.lineBreakMode = .byWordWrapping
           var paragraphStyle = NSMutableParagraphStyle()
           paragraphStyle.lineHeightMultiple = 1.18
           text4Label.attributedText = NSMutableAttributedString(string: text4, attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
           text4Label.textAlignment = NSTextAlignment.center

           return text4Label

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
    
    
    func setupSubviews(text3: String, text4: String) {
           
        self.text3 = text3
        self.text4 = text4
                
        self.view.addSubview(text3Label)
        self.view.addSubview(text4Label)
        view.addSubview(timerImage)

    }
    
    
    func layoutViews() {

    
        text3Label.pin
        .top(300)
        .width(view.frame.size.width - 60)
        .height(117.0)
        .hCenter(0)
        
        text4Label.pin
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
