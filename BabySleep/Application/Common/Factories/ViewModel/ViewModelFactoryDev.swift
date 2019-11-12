//
//  ViewModelFactoryDev.swift
//  BabySleep
//
//  Created by Константин on 11.11.2019.
//  Copyright © 2019 Денис Львович. All rights reserved.
//

final class ViewModelFactoryDev: ViewModelFactory {
    
    func makeRegimeListViewModel() -> RegimeListViewModel {
        return RegimeListViewModel()
    }
    
    func makeReportViewModel() -> ReportViewModel {
        return ReportViewModel()
    }
    
    func makeTrainingViewModel() -> TrainingViewModel {
        return TrainingViewModel()
    }
    
    
    func makeDetailTableViewModel() -> DetailViewModel {
        return DetailViewModel()
    }
    
}
