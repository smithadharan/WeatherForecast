//
//  WeatherHomeViewRepositaryProtocol.swift
//  WeatherForecast
//
//  Created by smitha Dharan on 07/08/2022.
//

import Foundation
import RxSwift

protocol WeatherHomeViewRepositaryProtocol {
    var networkManager  : NetworkManagerProtocol? { get }
    var weatherData  : PublishSubject<WeatherResponseModel> { get }
    var weatherError : PublishSubject<AppError> { get }
    
    func getWeatherByCity (city :String)
    func fetchWeatherDataWith(lattitude: Double,
                              longitude: Double)
}
