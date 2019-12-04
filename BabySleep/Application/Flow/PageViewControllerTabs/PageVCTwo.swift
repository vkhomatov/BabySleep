//
//  PageVCTwo.swift
//  BabySleep
//
//  Created by Vit on 13.11.2019.
//  Copyright © 2019 Денис Львович. All rights reserved.
//

import UIKit
import PinLayout


class PageVCTwo: UIViewController {
   private var model = PageVCModelTwo()
    
    lazy var viewP: PageVCViewTwo = {
             return PageVCViewTwo(frame: self.view.frame)
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
           viewP.setupSubviews(text3: model.text3, text4: model.text4)
           viewP.layoutViews()
          }

}
