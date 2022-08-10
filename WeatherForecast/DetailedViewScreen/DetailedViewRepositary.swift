//
//  DetailedViewRepositary..swift
//  WeatherForecast
//
//  Created by smitha Dharan on 07/08/2022.
//

import Foundation

class DetailedViewRepositary: DetailedViewRepositaryProtocol {
    var networkManager : NetworkManagerProtocol?
    
    init(networkManager: NetworkManagerProtocol?) {
        self.networkManager = networkManager
    }
    
}
