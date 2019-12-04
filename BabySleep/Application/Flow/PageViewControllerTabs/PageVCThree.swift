//
//  PageVCThree.swift
//  BabySleep
//
//  Created by Vit on 13.11.2019.
//  Copyright © 2019 Денис Львович. All rights reserved.
//

import UIKit

class PageVCThree: UIViewController {

    private let model = PageVCModelThree()
              
    lazy var viewP: PageVCViewThree = {
        return PageVCViewThree(frame: self.view.frame)
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
        viewP.setupSubviews(text5: model.text5, text6: model.text6)
        viewP.layoutViews()
        
    }
    
}
