//
//  WeatherListsModel.swift
//  WeatherForecast
//
//  Created by smitha Dharan on 07/08/2022.
//

import Foundation

class WeatherListsModel : Decodable {
    
    var date : String?
    var weather: [WeatherDataModel]?
    
    enum codeingKeys : String, CodingKey {
        case date = " dt_txt"
        case weather
    }
}

