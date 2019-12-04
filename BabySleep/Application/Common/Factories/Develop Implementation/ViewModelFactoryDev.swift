//
//  ViewModelFactoryDev.swift
//  BabySleep
//
//  Created by Денис Львович on 10/10/2019.
//  Copyright © 2019 Денис Львович. All rights reserved.
//

final class ViewModelFactoryDev: ViewModelFactory {
    
    func makePageViewModel() -> PageViewModel {
             return PageViewModel()
    }
    
    func makeNewEdgeCategoryModel() -> NewEdgeCategoryModel {
             return NewEdgeCategoryModel()
    }
    
}
