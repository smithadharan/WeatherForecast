//
//  Utility.swift
//  WeatherForecast
//
//  Created by smitha Dharan on 08/08/2022.
//

import Foundation
import UIKit
import MBProgressHUD

class Utility {
    static func infoForKey(_ key: String) -> String? {
        return (Bundle.main.infoDictionary?[key] as? String)?.replacingOccurrences(of: "\\", with: "")
    }
    
    static func showIndicatorOnly(on view: UIView){
        let Indicator = MBProgressHUD.showAdded(to: view, animated: true)
        Indicator.mode = .indeterminate
        Indicator.isUserInteractionEnabled = false
        Indicator.show(animated: true)
    }
    
    static func showIndicator(withTitle title: String = "loading".localizedString(),
                              and Description:String = "wait_msg".localizedString(),
                              on view: UIView,
                              mode: MBProgressHUDMode = .text) {
        let Indicator = MBProgressHUD.showAdded(to: view, animated: true)
        Indicator.mode = mode
        Indicator.label.text = title
        Indicator.isUserInteractionEnabled = false
        Indicator.detailsLabel.text = Description
        Indicator.show(animated: true)
    }
    
    static func hideIndicator(_ view: UIView) {
        MBProgressHUD.hide(for: view, animated: true)
    }
}
