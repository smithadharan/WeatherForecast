//
//  WeatherHomeFactory.swift
//  WeatherForecast
//
//  Created by smitha Dharan on 07/08/2022.
//

import Foundation

protocol WeatherHomeFactory {
    func makeWeatherHomeViewModel(coordinator: WeatherHomeViewCoordinator) -> WeatherHomeviewModel
    func makeWeatherHomeViewController(coordinator: WeatherHomeViewCoordinator) -> WeatherHomeViewController?
    func makeWeatherHomeViewCoordinator(router: Router, factory:WeatherHomeFactory) -> WeatherHomeViewCoordinator?
    
}

