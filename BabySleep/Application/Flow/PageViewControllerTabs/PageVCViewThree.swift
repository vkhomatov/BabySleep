//
//  PageVCViewThree.swift
//  BabySleep
//
//  Created by Vit on 13.11.2019.
//  Copyright © 2019 Денис Львович. All rights reserved.
//

import UIKit

class PageVCViewThree: UIView {
    
    var text5 = String()
    var text6 = String()
    
    let fontName = "SFProText-Semibold"
    let timerImageName = "timer"

    
    lazy var text5Label: UILabel = {
        
        let text5Label = UILabel(frame: .zero)
        text5Label.text = text5
        text5Label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        text5Label.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        text5Label.font = UIFont(name: fontName, size: 17)
        text5Label.numberOfLines = 0
        text5Label.lineBreakMode = .byWordWrapping
        
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.18
        text5Label.attributedText = NSMutableAttributedString(string: text5, attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        text5Label.textAlignment = NSTextAlignment.center

        return text5Label

    }()
    

     lazy var text6Label: UILabel = {
           
        let text6Label = UILabel(frame: .zero)
        text6Label.text = text6
        text6Label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        text6Label.backgroundColor =  UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        text6Label.font = UIFont(name: fontName, size: 17)
        text6Label.numberOfLines = 0
        text6Label.lineBreakMode = .byWordWrapping
        
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.18
        text6Label.attributedText = NSMutableAttributedString(string: text6, attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        text6Label.textAlignment = NSTextAlignment.center

        return text6Label

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
    
    
     func setupSubviews(text5: String, text6: String) {
              
        self.text5 = text5
        self.text6 = text6
                
        self.view.addSubview(text5Label)
        self.view.addSubview(text6Label)
        view.addSubview(timerImage)

    }
    
    
    func layoutViews() {

        text5Label.pin
        .top(300)
        .width(view.frame.size.width - 60)
        .height(117.0)
        .hCenter(0)
        
        text6Label.pin
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
