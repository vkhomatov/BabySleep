//
//  TabBarCoordinator.swift
//  BabySleep
//
//  Created by Константин on 06.11.2019.
//  Copyright © 2019 Денис Львович. All rights reserved.
//

import Foundation
import XCoordinator

enum BSTabBarRoute: Route {
    case regime
    case reports
    case training
}

final class BSTabBarCoordinator: TabBarCoordinator<BSTabBarRoute> {
    private let regimeRouter: StrongRouter<RegimeRoute>
    private let reportRoute: StrongRouter<ReportRoute>
    private let trainingRoute: StrongRouter<TrainingRoute>
    private let detailRoute: StrongRouter<DetailRoute>
    
    
    init() {
        
        let coordinatorFactory = BSCoordinatorFactoryDev()
        
        let regimeVCFactory = RegimeViewControllerFactoryDev()
        let regimeVMFactory = RegimeViewModelFactoryDev()
        
        let reportVCFactory = ReportViewControllerFactoryDev()
        let reportVMFactory = ReportViewModelFactoryDev()
        
        let trainingVCFactory = TrainingViewControllerFactoryDev()
        let trainingVMFactory = TrainingViewModelFactoryDev()
        
        let detailVCFactory = DetailViewControllerFactoryDev()
        let detailVMFactory = DetailViewModelFactoryDev()
        
        
        let regimeCoordinator = coordinatorFactory.makeRegimeCoordinator(controllerFactory: regimeVCFactory, modelFactory: regimeVMFactory)
        let reportCoordinator = coordinatorFactory.makeReportCoordinator(controllerFactory: reportVCFactory, modelFactory: reportVMFactory)
        let trainingCoordinator = coordinatorFactory.makeTrainingCooordinator(controllerFactory: trainingVCFactory, modelFactory: trainingVMFactory)
        let detailCoordinator = coordinatorFactory.makeDetailCoordinator(controllerFactory: detailVCFactory, modelFactory: detailVMFactory)
        
        
        regimeCoordinator.rootViewController.tabBarItem = UITabBarItem(title: "Режим",
                                                                       image: nil,
                                                                       selectedImage: nil)
        
        reportCoordinator.rootViewController.tabBarItem = UITabBarItem(title: "Отчет",
                                                                       image: nil,
                                                                       selectedImage: nil)
        
        trainingCoordinator.rootViewController.tabBarItem = UITabBarItem(title: "Обучение",
                                                                         image: nil,
                                                                         selectedImage: nil)
        
        detailCoordinator.rootViewController.tabBarItem = UITabBarItem(title: "Еще",
                                                                       image: nil,
                                                                       selectedImage: nil)
        
        self.regimeRouter = regimeCoordinator.strongRouter
        self.reportRoute = reportCoordinator.strongRouter
        self.trainingRoute = trainingCoordinator.strongRouter
        self.detailRoute = detailCoordinator.strongRouter
        
        super.init(tabs: [regimeRouter, trainingRoute, reportRoute, detailRoute], select: 0)
        
    }
    
    
    override func prepareTransition(for route: BSTabBarRoute) -> TabBarTransition {
        
        switch route {
        case .regime:
            return .select(regimeRouter)
        case .reports:
            return  .select(reportRoute)
        case .training:
            return .select(trainingRoute)
        }
        
    }

    
}
