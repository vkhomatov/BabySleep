//
//  ViewModelFactory.swift
//  BabySleep
//
//  Created by Константин on 11.11.2019.
//  Copyright © 2019 Денис Львович. All rights reserved.
//

protocol ViewModelFactory {
    
    func makeDetailTableViewModel() -> DetailViewModel
    func makeRegimeListViewModel() -> RegimeListViewModel
    func makeReportViewModel() -> ReportViewModel
    func makeTrainingViewModel() -> TrainingViewModel
    
}
