//
//  PageController.swift
//  BabySleep
//
//  Created by Denis Abramov on 26.10.2019.
//  Copyright © 2019 Денис Львович. All rights reserved.
//

import UIKit
import XCoordinator
import PinLayout

class PageController: UIViewController {
    
    private let model: PageModel
    private let router: UnownedRouter<SampleRoute>

    init(model: PageModel, router: UnownedRouter<SampleRoute>) {
        self.model = model
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    convenience required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .orange
        setupView()
    }
    
    private func setupView() {
        let button = UIButton()
        
        view.addSubview(button)
        
        button.pin.centerLeft(50)
        .width(20%)
        .height(10%)
        
        button.layer.cornerRadius = button.frame.size.height / 5
        button.layer.masksToBounds = true
        button.backgroundColor = .green
        button.setTitle("Green", for: .normal)
        button.setTitleColor(.black, for: .normal)
        
        button.addTarget(self, action: #selector(self.buttonPressed), for: .touchUpInside)
        
        let redButton = UIButton()
        
        view.addSubview(redButton)
            
        redButton.pin.centerRight(50)
        .width(20%)
        .height(10%)
        
        redButton.layer.cornerRadius = button.frame.size.height / 5
        redButton.layer.masksToBounds = true
        redButton.backgroundColor = .red
        redButton.setTitle("Red", for: .normal)
        redButton.setTitleColor(.black, for: .normal)
        
        redButton.addTarget(self, action: #selector(self.redButtonPressed), for: .touchUpInside)
    }
    
    @objc private func buttonPressed() {
        router.trigger(.anotherViewController)
    }
    
    @objc private func redButtonPressed() {
        router.trigger(.viewController)
    }
    
}
