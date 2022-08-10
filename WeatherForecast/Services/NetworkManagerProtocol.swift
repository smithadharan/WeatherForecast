//
//  NetworkManagerProtocol.swift
//  WeatherForecast
//
//  Created by smitha Dharan on 08/08/2022.
//

import Foundation

protocol NetworkManagerProtocol {
    func fetchWeatherData(lattitude: Double,
                          longitude: Double,
                          compelition: @escaping (Result<WeatherResponseModel>) -> Void)
}
