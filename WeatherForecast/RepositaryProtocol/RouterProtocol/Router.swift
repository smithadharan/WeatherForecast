//
//  Router.swift
//  WeatherForecast
//
//  Created by smitha Dharan on 07/08/2022.
//

import Foundation
import UIKit

public protocol Router:AnyObject {
    func present(_ viewController: UIViewController, animated: Bool)
    func present(_ viewController: UIViewController, animated: Bool, onDismissed:(()->Void)?)
    // to dismiss entire Router:
    func dismiss(animated: Bool)
    
    func setRootViewController(_ viewController: UIViewController)
    func setRootViewController(_ viewController: UIViewController, hideBar: Bool)
}

extension Router {
    public func present(_ viewController: UIViewController, animated: Bool) {
        present(viewController, animated: true, onDismissed: nil)
    }
    
}
