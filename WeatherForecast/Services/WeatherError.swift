//
//  WeatherError.swift
//  WeatherForecast
//
//  Created by smitha Dharan on 08/08/2022.
//

import Foundation

public enum WeatherError: LocalizedError {
    case noInternetConnection
    case requestTimeout
    case unknown
    
    public var errorDescription: String? {
        switch self {
        case .noInternetConnection:
            return "No Internet Connection"
        case .requestTimeout:
            return "The request timed out."
        case .unknown:
            return "something_went_wrong".localizedString()
        }
    }
    
}
