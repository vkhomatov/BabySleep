//
//  RegimeViewModelFactoryDev.swift
//  BabySleep
//
//  Created by Константин on 06.11.2019.
//  Copyright © 2019 Денис Львович. All rights reserved.
//

final class RegimeViewModelFactoryDev: RegimeViewModelFactory {
    
    func makeRegimeListViewModel() -> RegimeListViewModel {
        return RegimeListViewModel()
    }
    
}
