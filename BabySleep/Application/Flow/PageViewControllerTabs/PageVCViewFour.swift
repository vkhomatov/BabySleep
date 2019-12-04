//
//  PageVCViewFour.swift
//  BabySleep
//
//  Created by Vit on 15.11.2019.
//  Copyright © 2019 Денис Львович. All rights reserved.
//

import UIKit

class PageVCViewFour: UIView {
    
   
    let textColor = UIColor(rgb: 0x4FA6A0)
    let fontName = "SFProText-Semibold"
    
    let boyButtonTitle = "Мальчик"
    let girlButtonTitle = "Девочка"
    public let startButtonTitle = "Начать использование"
    
    var text7 = String()
    var childName = String()
    var childDOB = String()
    var childGender = String()

    
    lazy var text7Label: UILabel = {
        let text7Label = UILabel(frame: .zero)
        
        text7Label.text = text7
        text7Label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        text7Label.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        text7Label.font = UIFont(name: fontName, size: 17)
        text7Label.numberOfLines = 0
        text7Label.lineBreakMode = .byWordWrapping
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.18
        text7Label.attributedText = NSMutableAttributedString(string: text7, attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        text7Label.textAlignment = NSTextAlignment.center

        return text7Label
    }()
    
    
    lazy var childNameLabel: UILabel = {
           let childNameLabel = UILabel(frame: .zero)
        
        childNameLabel.text = childName
        childNameLabel.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        childNameLabel.backgroundColor =  UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        childNameLabel.font = UIFont(name: fontName, size: 15)
        childNameLabel.numberOfLines = 0
        childNameLabel.textAlignment = NSTextAlignment.left
    
        return childNameLabel

    }()
    
    
    lazy var childNameTextField: UITextField = {
           
        let childNameTextField = UITextField(frame: .zero)
        childNameTextField.textColor = textColor//UIColor(rgb: 0x4FA6A0)
        childNameTextField.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        childNameTextField.font = UIFont(name: fontName, size: 17)
        childNameTextField.textAlignment = NSTextAlignment.left
        childNameTextField.layer.cornerRadius = 5

        return childNameTextField

    }()
    
    lazy var childDOBLabel: UILabel = {
        let childDOBLabel = UILabel(frame: .zero)
        
        childDOBLabel.text = childDOB
        childDOBLabel.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        childDOBLabel.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        childDOBLabel.font = UIFont(name: fontName, size: 15)
        childDOBLabel.numberOfLines = 0
        childDOBLabel.textAlignment = NSTextAlignment.left
     
        return childDOBLabel

    }()
    
    
    lazy var childDOBTextField: UITextField = {
           
        let childDOBTextField = UITextField(frame: .zero)
        childDOBTextField.textColor = textColor//UIColor(rgb: 0x4FA6A0)
        childDOBTextField.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        childDOBTextField.font = UIFont(name: fontName, size: 17)
        childDOBTextField.textAlignment = NSTextAlignment.left
        childDOBTextField.layer.cornerRadius = 5

        return childDOBTextField

    }()
    
    lazy var childGenderLabel: UILabel = {
           
        let childGenderLabel = UILabel(frame: .zero)
        childGenderLabel.text = childGender
        childGenderLabel.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        childGenderLabel.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        childGenderLabel.font = UIFont(name: fontName, size: 17)
        childGenderLabel.numberOfLines = 0
        childGenderLabel.textAlignment = NSTextAlignment.left
    
        return childGenderLabel

    }()
    
    lazy var boyButton: UIButton = {
         let boyButton = UIButton(frame: .zero)
        
        boyButton.setTitle(boyButtonTitle, for: .normal)
        
        boyButton.setTitleColor(textColor, for: .normal)
        boyButton.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        boyButton.titleLabel?.font = UIFont(name: fontName, size: 17)
        
        boyButton.layer.cornerRadius = 5
        boyButton.layer.borderWidth = 1
        boyButton.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor

      return boyButton
    }()
    
    lazy var girlButton: UIButton = {
        let girlButton = UIButton(frame: .zero)
        
        girlButton.setTitle(girlButtonTitle, for: .normal)
        girlButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        girlButton.titleLabel?.font = UIFont(name: fontName, size: 17)
        
        girlButton.backgroundColor = .clear
        girlButton.layer.cornerRadius = 5
        girlButton.layer.borderWidth = 1
        girlButton.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
      
        return girlButton
    }()
    
    
    lazy var datePicker: UIDatePicker = {
        
        let datePicker = UIDatePicker(frame: .zero)
        datePicker.datePickerMode = .date
        datePicker.timeZone = NSTimeZone.local
        datePicker.backgroundColor = UIColor.white
        datePicker.maximumDate = Date()

        return datePicker
    }()
    
    lazy var toolBar: UIToolbar = {
        
        let toolBar = UIToolbar(frame: .zero)
        
        return toolBar
    }()
    
      lazy var starUseAppButton: UIButton = {
        let starUseAppButton = UIButton(frame: .zero)
        
        starUseAppButton.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        starUseAppButton.setTitle(startButtonTitle, for: .normal)
        starUseAppButton.setTitleColor(textColor, for: .normal)
        starUseAppButton.titleLabel?.font = UIFont(name: fontName, size: 17)
        starUseAppButton.layer.cornerRadius = 5
           
        return starUseAppButton
    }()
    
    
    override init(frame: CGRect) {

        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupSubviews(text7: String, childName: String, childDOB: String, childGender: String) {
        
        self.text7 = text7
        self.childName = childName
        self.childDOB = childDOB
        self.childGender = childGender
        
        self.view.addSubview(text7Label)
        self.view.addSubview(childNameLabel)
        self.view.addSubview(childNameTextField)
        self.view.addSubview(childDOBLabel)
        self.view.addSubview(childDOBTextField)
        self.view.addSubview(childGenderLabel)
        self.view.addSubview(boyButton)
        self.view.addSubview(girlButton)

    }
    
    
    func setupDatePickerView() {
        
        datePicker.pin
        .bottom(-200)
        .hCenter(0)
        .width(view.frame.size.width)
        .height(200)
        
        toolBar.sizeToFit()
        
       // self.view.addSubview(datePicker)
    }
    
    
    func layoutViews() {
    
        text7Label.pin
        .top(300)
        .width(view.frame.size.width - 60)
        .height(100.0)
        .hCenter(0)
        
        childNameLabel.pin
        .top(400)
        .width(view.frame.size.width - 60)
        .height(45.0)
        .hCenter(0)
        
        childNameTextField.pin
        .top(450)
        .width(view.frame.size.width - 60)
        .height(45.0)
        .hCenter(0)
        
        childDOBLabel.pin
        .top(500)
        .width(view.frame.size.width - 60)
        .height(45.0)
        .hCenter(0)
        
        childDOBTextField.pin
        .top(550)
        .width(view.frame.size.width - 60)
        .height(45.0)
        .hCenter(0)
        
        childGenderLabel.pin
        .top(600)
        .width(view.frame.size.width - 60)
        .height(45.0)
        .hCenter(0)
        
        boyButton.pin
        .top(650)
        .width((view.frame.size.width - 60)/2 - 30)
        .height(45.0)
        .hCenter((view.frame.size.width / 4) * -1)
        
        girlButton.pin
        .top(650)
        .width((view.frame.size.width - 60)/2 - 30)
        .height(45.0)
        .hCenter((view.frame.size.width / 4))
           
        starUseAppButton.pin
        .bottom(100)
        .width(view.frame.size.width - 60)
        .height(45.0)
        .hCenter(0)
        
    }

}
