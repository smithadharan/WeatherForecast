//
//  APIConfiguration.swift
//  WeatherForecast
//
//  Created by smitha Dharan on 08/08/2022.
//

import Foundation
import Alamofire

protocol APIConfiguration: URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: RequestParams { get }
}
