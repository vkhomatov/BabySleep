//
//  ViewModelFactory.swift
//  BabySleep
//
//  Created by Денис Львович on 10/10/2019.
//  Copyright © 2019 Денис Львович. All rights reserved.
//

protocol ViewModelFactory {
    func makeViewModel() -> ViewModel
    func makeAnotherViewModel() -> AnotherViewModel
}
