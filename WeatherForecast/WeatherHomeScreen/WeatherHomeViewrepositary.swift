//
//  WeatherHomeViewrepositary.swift
//  WeatherForecast
//
//  Created by smitha Dharan on 07/08/2022.
//

import Foundation
import RxSwift

class WeatherHomeViewrepositary: WeatherHomeViewRepositaryProtocol {
    
    var networkManager : NetworkManagerProtocol?
    
    var weatherData = PublishSubject<WeatherResponseModel> ()
    var weatherError = PublishSubject<AppError> ()
    
    init(networkManager: NetworkManagerProtocol?) {
        self.networkManager = networkManager
    }
    
    func getWeatherByCity(city: String) {
        
    }
    
    func fetchWeatherDataWith(lattitude: Double, longitude: Double) {
        networkManager?.fetchWeatherData(lattitude: lattitude,
                                         longitude: lattitude,
                                         compelition: { [weak self] (response) in
            switch response {
            case .success(let response):
                self?.weatherData.onNext(response)
                break
            case .failure(let error):
                self?.weatherError.onNext(error)
                break
            }
        })
    }
    
}
