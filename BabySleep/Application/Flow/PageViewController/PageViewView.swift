//
//  PageViewView.swift
//  BabySleep
//
//  Created by Vit on 16.11.2019.
//  Copyright © 2019 Денис Львович. All rights reserved.
//

import UIKit

class PageViewView: UIView {
    
    
    var startButtonTitle = String()
    var colorBackground = UIColor()
    var fontName = String()
    var appName = String()
    var logoImageName = String()

    
    lazy var nextButton: UIButton = {
        let nextButton = UIButton(frame: .zero)
        nextButton.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        nextButton.setTitle(startButtonTitle, for: .normal)
        nextButton.setTitleColor(colorBackground, for: .normal)
        nextButton.titleLabel?.font = UIFont(name: fontName, size: 17)
        nextButton.layer.cornerRadius = 5
     
        return nextButton
    }()
    
    lazy var logoName: UILabel = {
           
        let logoName = UILabel(frame: .zero)
        logoName.text = appName
        logoName.textAlignment = NSTextAlignment.center
        logoName.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        logoName.backgroundColor = colorBackground
        logoName.font = UIFont(name: fontName, size: 17)
      
        return logoName
    }()
       
    lazy var logoImage: UIImageView = {
           
        let logoImage = UIImageView(frame: .zero)
        logoImage.image = UIImage(named: logoImageName)
           
        return logoImage
    }()
    
    
    func setupSubviews(view: UIView!, appName: String, startButtonTitle: String, fontName: String, logoImageName: String, colorBackground: UIColor) {
        
        self.startButtonTitle = startButtonTitle
        self.colorBackground = colorBackground
        self.fontName = fontName
        self.appName = appName
        self.logoImageName = logoImageName
        
        view.addSubview(nextButton)
        view.addSubview(logoImage)
        view.addSubview(logoName)

    }
    
    func layoutNextButton(view: UIView!) {
        
        nextButton.pin
            .bottom(100)
            .width(view.frame.size.width - 60)
            .height(45.0)
            .hCenter(0)
        
        logoName.pin
            .top(200)
            .width(view.frame.size.width)
            .height(45.0)
            .hCenter(0)
        
        logoImage.pin
            .top(120)
            .height(70)
            .aspectRatio()
            .hCenter(0)
        
    }
    
}
