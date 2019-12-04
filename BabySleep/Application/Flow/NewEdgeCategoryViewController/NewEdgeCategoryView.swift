//
//  NewEdgeCategoryView.swift
//  BabySleep
//
//  Created by Vit on 03.12.2019.
//  Copyright © 2019 Денис Львович. All rights reserved.
//

import UIKit
import XCoordinator
import PinLayout

class NewEdgeCategoryView: UIView {

    
    lazy var resetButton: UIButton = {
         let resetButton = UIButton(frame: .zero)
        
        resetButton.setTitle("Reset UserDefaults", for: .normal)
        
        resetButton.setTitleColor(.red, for: .normal)
        resetButton.backgroundColor = UIColor(red: 10, green: 20, blue: 40, alpha: 1)
        resetButton.titleLabel?.font = UIFont(name: "System", size: 17)
        
        resetButton.layer.cornerRadius = 5
        resetButton.layer.borderWidth = 1
        resetButton.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor

      return resetButton
    }()

    
    override init(frame: CGRect) {

           super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubviews() {
        view.backgroundColor = .green
        view.addSubview(resetButton)
    }
       
    
    func layoutViews() {
    
    resetButton.pin.center()
        .width(40%)
        .height(5%)
    
    }
}
