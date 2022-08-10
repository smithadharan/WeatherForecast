//
//  APIConstant.swift
//  WeatherForecast
//
//  Created by smitha Dharan on 08/08/2022.
//

import Foundation
import Alamofire

typealias ResponseCallback = (_ result: Any?) -> Void

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
    case string = "String"
}

enum ContentType: String {
    case json = "Application/json"
    case formEncode = "application/x-www-form-urlencoded"
}

enum RequestParams {
    case body(_:Parameters)
    case url(_:Parameters)
}

public enum Result<Value> {
    case success(Value)
    case failure(AppError)
    
    public var isSuccess: Bool {
        switch self {
        case .success:
            return true
        case .failure:
            return false
        }
    }
    
    public var isFailure: Bool {
        return !isSuccess
    }
    
    public var value: Value? {
        switch self {
        case .success(let value):
            return value
        case .failure:
            return nil
        }
    }
}

public enum AppError: Error {
    case appError
    case serverError
    case noData
    case decodingError
    case unknown
    case invalidUrl
    
    func stringMessage() -> String {
        switch self {
        case .appError:
            return "Application Error"
        case .serverError:
            return "Server Error"
        case .noData:
            return "No data"
        case .decodingError:
            return "Decoding Error"
        case .unknown:
            return "Unknown Error"
        case .invalidUrl:
            return "Invalid Url"
        }
    }
}
