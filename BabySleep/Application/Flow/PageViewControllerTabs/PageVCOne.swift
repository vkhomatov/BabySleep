//
//  PageVCOne.swift
//  BabySleep
//
//  Created by Vit on 12.11.2019.
//  Copyright © 2019 Денис Львович. All rights reserved.
//

import UIKit
import XCoordinator

class PageVCOne: UIViewController {
    
    private var model = PageVCModelOne()
    
    lazy var viewP: PageVCViewOne = {
        return PageVCViewOne(frame: self.view.frame)
    }()
    
    init() {
         super.init(nibName: nil, bundle: nil)
       }
            
    required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = viewP
        viewP.setupSubviews(text1: model.text1, text2: model.text2)
        viewP.layoutViews()
       }
    
}
