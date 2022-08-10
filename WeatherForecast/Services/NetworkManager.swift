//
//  NetworkManager.swift
//  WeatherForecast
//
//  Created by smitha Dharan on 07/08/2022.
//

import Foundation
import Alamofire

class NetworkManager: NetworkManagerProtocol {
    
    func fetchWeatherData(lattitude: Double,
                          longitude: Double,
                          compelition: @escaping (Result<WeatherResponseModel>) -> Void) {
        
        AF.request(APIRouter.fetchWeatherData(lattitude: lattitude,
                                              longitude: longitude)).responseDecodable { (response: DataResponse<WeatherResponseModel, AFError>) in
            switch response.result {
            case .success(let response):
                compelition(.success(response))
                break
            case .failure(let error):
                compelition(.failure(self.parseError(error: error)))
                break
            }
        }
    }
    
    func parseError(error: AFError) -> AppError {
        if error.isInvalidURLError {
            return .invalidUrl
        } else {
            if let responseCode = error.responseCode {
                let invalidResponseRange = 200...299
                if invalidResponseRange.contains(responseCode) {
                    return .serverError
                }
            }
        }
        
        return .appError
    }
}
