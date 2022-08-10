//
//  DetailedViewModel.swift
//  WeatherForecast
//
//  Created by smitha Dharan on 07/08/2022.
//

import Foundation
import RxSwift

class DetailedViewModel {
    var dataSource = [WeatherTableCellModel]()
    var weatherResponse: WeatherResponseModel?
    let disposeBag = DisposeBag()
    
    let detailedRepositary : DetailedViewRepositaryProtocol?
    
    init(repository:DetailedViewRepositaryProtocol) {
        self.detailedRepositary = repository
    }
}
