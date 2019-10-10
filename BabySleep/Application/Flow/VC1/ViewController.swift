//
//  ViewController.swift
//  BabySleep
//
//  Created by Денис Львович on 09/10/2019.
//  Copyright © 2019 Денис Львович. All rights reserved.
//

import UIKit
import XCoordinator
import PinLayout

class ViewController: UIViewController {

    private let model: ViewModel
    private let router: UnownedRouter<SampleRoute>

    init(model: ViewModel, router: UnownedRouter<SampleRoute>) {
        self.model = model
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }

    convenience required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red

        setupView()
    }

    private func setupView() {
        let button = UIButton()

        view.addSubview(button)

        button.pin.center()
            .width(40%)
            .height(5%)

        button.layer.cornerRadius = button.frame.size.height / 2
        button.layer.masksToBounds = true

        button.backgroundColor = .white
        button.setTitle("Press me", for: .normal)
        button.setTitleColor(.black, for: .normal)

        button.addTarget(self, action: #selector(self.buttonPressed), for: .touchUpInside)
    }

    @objc private func buttonPressed() {
        router.trigger(.anotherViewController)
    }
}
