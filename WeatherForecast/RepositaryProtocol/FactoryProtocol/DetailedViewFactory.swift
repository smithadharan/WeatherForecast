//
//  DetailedViewFactory.swift
//  WeatherForecast
//
//  Created by smitha Dharan on 07/08/2022.
//

import Foundation

protocol DetailedViewFactory {
    func makeDetailedViewModel(coordinator: DetailedViewCoordinator) -> DetailedViewModel
    func makeDetailedViewController(coordinator: DetailedViewCoordinator) -> DetailedViewController?
    func makeDetailedViewCoordinator(router: Router, factory: DetailedViewFactory) -> DetailedViewCoordinator?
    
}
