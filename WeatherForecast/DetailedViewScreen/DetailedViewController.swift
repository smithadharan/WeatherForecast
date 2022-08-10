//
//  DetailedViewController.swift
//  WeatherForecast
//
//  Created by smitha Dharan on 07/08/2022.
//

import Foundation
import UIKit

protocol DetailedViewControllerDelegate {
    func backButtonPressed()
}


class DetailedViewController : UIViewController {
    
    var viewModel: DetailedViewModel?
    var delegate : DetailedViewControllerDelegate?
    
    
    @IBOutlet weak var descText: UILabel!
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var backButtonPressed: UIButton!
    
    required init?(coder aDecoder : NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        delegate?.backButtonPressed()
    }
    
    
}
