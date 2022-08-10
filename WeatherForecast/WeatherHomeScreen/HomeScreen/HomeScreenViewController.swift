//
//  HomeScreenViewController.swift
//  WeatherForecast
//
//  Created by smitha Dharan on 09/08/2022.
//

import UIKit

protocol HomeScreenViewControllerProtocol {
    
    func setUpUI()
}

class HomeScreenViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = UIColor.gray
    }
}
