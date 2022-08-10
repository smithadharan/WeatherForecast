//
//  UIStoryboard+Extension.swift
//  WeatherForecast
//
//  Created by smitha Dharan on 08/08/2022.
//
//

import UIKit

extension UIStoryboard {
    enum Storyboard: String {
        case main
//        case authentication
//        case tabbar
//        case session
//        case alarms
//        case discussion
//        case settings

        var filename: String {
            return rawValue.capitalized
        }
        
//        var tabTag: Int {
//            switch self {
//            case .session: return 0
//            case .alarms: return 1
//            case .discussion: return 2
//            case .settings: return 3
//            default: return 4
//            }
//        }
    }

    convenience init(storyboard: Storyboard, bundle: Bundle? = nil) {
        self.init(name: storyboard.filename, bundle: bundle)
    }

    static func storyboard(_ storyboard: Storyboard, bundle: Bundle? = nil) -> UIStoryboard {
        return UIStoryboard(name: storyboard.filename, bundle: bundle)
    }

    static func load(from storyboard: Storyboard, identifier: String) -> UIViewController {
        let uiStoryBoard = UIStoryboard.storyboard(storyboard)
        return uiStoryBoard.instantiateViewController(withIdentifier: identifier)
    }
}
