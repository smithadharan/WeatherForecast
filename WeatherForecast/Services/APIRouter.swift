//
//  APIRouter.swift
//  WeatherForecast
//
//  Created by smitha Dharan on 08/08/2022.
//

import Foundation
import Alamofire

enum APIRouter: APIConfiguration {
    
    case fetchWeatherData(lattitude: Double,
                          longitude: Double)
    
    var method: HTTPMethod {
        switch self {
        case .fetchWeatherData:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .fetchWeatherData:
            return "forecast/?"
        }
    }
    
    var parameters: RequestParams {
        switch self {
        case .fetchWeatherData(let lattitude,let longitude):
            return .url(["lat":lattitude,
                         "lon":longitude,
                         "appid":"48d9cff343b1e178519c0e0281081b79"])
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        
        
        let url = URL(string: "https://api.openweathermap.org/data/2.5/forecast/?")//URL(string: Utility.infoForKey("backendUrl")!)
        // var urlRequest = URLRequest(url: url!.appendingPathComponent(path))
        var urlRequest = URLRequest(url: url!)
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        
        // Parameters
        switch parameters {
            
        case .body(let params):
            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: params, options: [])
            
        case .url(let params):
            let queryParams = params.map { pair  in
                return URLQueryItem(name: pair.key, value: "\(pair.value)")
            }
            var components = URLComponents(url: url!, resolvingAgainstBaseURL: true)!
            // var components = URLComponents(string:url!.appendingPathComponent("?").relativePath)
            components.queryItems = queryParams
            urlRequest.url = components.url
        }
        return urlRequest
    }
}
