//
//  WeatherHomeViewModelTest.swift
//  WeatherForecastTests
//
//  Created by smitha Dharan on 10/08/2022.
//

import XCTest
import RxSwift


@testable import WeatherForecast


class WeatherHomeViewModelTest: XCTestCase, viewmodelProtocol{
    func createDataSource() {
        dataSource.append(WeatherTableCellModel(title: "Clear",
                                                description: "clear Sky",
                                                image: ""))
    }
    
    var weatherResponse: WeatherResponseModel?
    var dataSource = [WeatherTableCellModel]()
    let disposeBag = DisposeBag()
    var error = WeatherError.self
    let expectedResponseCount = 40
    let timeout = 120
    let successResponsecode = "200"
    
    var homeRepositary : WeatherHomeViewRepositaryProtocol?
    
    
    func test_getcurrentlocation () {
        LocationManager.shared.startUpdatingLocation()
        // let exp = expectation(description: "success")
        dataSource.append(WeatherTableCellModel(title: "Clear", description: "ClearSky", image: ""))
        
        LocationManager.shared.location.subscribe { [weak self] (location) in
            self?.homeRepositary?.fetchWeatherDataWith(lattitude: 37.5858, longitude: 51.4545)
        }.disposed(by: disposeBag)
        
        homeRepositary?.weatherData.subscribe { [weak self] (response) in
            self?.weatherResponse = response.element
            
        }
        XCTAssertEqual(1, dataSource.count)
    }
    
}


class WeatherTableCellModelTest {
    var title = "clear"
    var description = "clearsky"
    var imageUrl =  ""
    
    init(title: String?,
         description: String?,
         image: String?) {
        self.title = title!
        self.description = description!
        self.imageUrl = image ?? "no data"
    }
}

