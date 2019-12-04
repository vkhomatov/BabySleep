//
//  NewEdgeCategoryViewController.swift
//  BabySleep
//
//  Created by Vit on 03.12.2019.
//  Copyright © 2019 Денис Львович. All rights reserved.
//

import UIKit
import XCoordinator

class NewEdgeCategoryViewController: UIViewController {

           
       var model: NewEdgeCategoryModel
       let router: UnownedRouter<NewEdgeCategoryRoute>
       
       
       lazy var mainView: NewEdgeCategoryView = {
              return NewEdgeCategoryView(frame: self.view.frame)
       }()
       
       
       init(model: NewEdgeCategoryModel, router: UnownedRouter<NewEdgeCategoryRoute>) {
           self.model = model
           self.router = router
           super.init(nibName: nil, bundle: nil)
       }

       convenience required init?(coder aDecoder: NSCoder) {
           fatalError()
       }
    

       override func viewDidLoad() {
           super.viewDidLoad()
           self.view = mainView
        
           mainView.setupSubviews()
           mainView.layoutViews()
        
           mainView.resetButton.addTarget(self, action: #selector(self.buttonPressed), for: .touchUpInside)
        
      }
    
       @objc private func buttonPressed() {
        
           model.resetDefaults()
        
           print("Данные UserDefaults стерты")
       
      }

}
