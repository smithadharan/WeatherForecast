//
//  WeatherHomeviewModel.swift
//  WeatherForecast
//
//  Created by smitha Dharan on 07/08/2022.
//

import Foundation
import RxSwift

protocol viewmodelProtocol {
    func createDataSource()
}

class WeatherHomeviewModel {
    var dataSource = [WeatherTableCellModel]()
    var weatherResponse: WeatherResponseModel?
    let disposeBag = DisposeBag()
    
    
    let homeRepositary : WeatherHomeViewRepositaryProtocol?
    
    init(repository:WeatherHomeViewRepositaryProtocol) {
        self.homeRepositary = repository
    }
    
    func getCurrentLocation(onSuccess successBlock:@escaping (() -> Void),
                            onFailure failureBlock:@escaping ((_ err: String?) -> Void)) {
        LocationManager.shared.startUpdatingLocation()
        
        LocationManager.shared.location.subscribe { [weak self] (location) in
            self?.homeRepositary?.fetchWeatherDataWith(lattitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        }.disposed(by: disposeBag)
        
        homeRepositary?.weatherData.subscribe { [weak self] (response) in
            self?.weatherResponse = response.element
            self?.createDataSource()
            successBlock()
        }.disposed(by: disposeBag)
        
        homeRepositary?.weatherError.subscribe { (response) in
            failureBlock(response.element?.stringMessage())
        }.disposed(by: disposeBag)
    }
}


extension WeatherHomeviewModel: viewmodelProtocol {
    
    func createDataSource() {
        
        if self.dataSource.count > 0 {
            self.dataSource.removeAll()
        }
        if let list = self.weatherResponse?.list {
            for item in list {
                if let weather = item.weather {
                    if weather.count > 0 {
                        let imgUrl = Utility.infoForKey("imageRepoBaseUrl")?.appending(("\(weather[0].icon ?? "Icons").png"))
                        self.dataSource.append( WeatherTableCellModel(title: weather[0].main  ?? "",
                                                                      description: weather[0].description ?? "",
                                                                      image: imgUrl))
                    }
                }
            }
        }
    }
}

