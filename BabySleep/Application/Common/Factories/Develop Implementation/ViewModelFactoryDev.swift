//
//  ViewModelFactoryDev.swift
//  BabySleep
//
//  Created by Денис Львович on 10/10/2019.
//  Copyright © 2019 Денис Львович. All rights reserved.
//

final class ViewModelFactoryDev: ViewModelFactory {

    func makeViewModel() -> ViewModel {
        return ViewModel()
    }

    func makeAnotherViewModel() -> AnotherViewModel {
        return AnotherViewModel()
    }
    
    func makePageModel() -> PageModel {
    return PageModel()
    }
}
