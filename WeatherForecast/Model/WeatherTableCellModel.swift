//
//  WeatherTableCellModel.swift
//  WeatherForecast
//
//  Created by smitha Dharan on 07/08/2022.
//

import Foundation

class WeatherTableCellModel {
    var title: String?
    var description: String?
    var imageUrl: String?
    
    init(title: String?,
         description: String?,
         image: String?) {
        self.title = title
        self.description = description
        self.imageUrl = image
    }
    
}
