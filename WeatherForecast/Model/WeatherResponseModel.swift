//
//  WeatherResponseModel.swift
//  WeatherForecast
//
//  Created by smitha Dharan on 07/08/2022.
//

import Foundation

struct WeatherResponseModel: Decodable {
    var responseCode : String?
    var list: [WeatherListsModel]?
    
    enum codeingKeys : String, CodingKey {
        case responseCode = " cod"
        case list
    }
}
