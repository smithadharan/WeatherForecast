//
//  WeatherHomeViewrepositaryTest.swift
//  WeatherForecastTests
//
//  Created by smitha Dharan on 10/08/2022.
//

import XCTest
import RxSwift
@testable import WeatherForecast

class WeatherHomeViewrepositaryTest: XCTestCase {

    var networkManager : NetworkManagerProtocol?
    let sut = WeatherHomeViewrepositary(networkManager:NetworkManagerProtocol.self as? NetworkManagerProtocol)
    var weatherData = PublishSubject<WeatherResponseModel> ()
    var weatherError = PublishSubject<AppError> ()
    var response : WeatherResponseModel?
    
    func test_fetchWeatherData_valid () {
        networkManager?.fetchWeatherData(lattitude: <#T##Double#>, longitude: <#T##Double#>, compelition: <#T##(Result<WeatherResponseModel>) -> Void#>)
        self.networkManager?.fetchWeatherData (lattitude: 37.785834, longitude: 37.785834, compelition: (response))
        
            
        
    }
    
}
