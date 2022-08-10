//
//  WeatherHomeViewController.swift
//  WeatherForecast
//
//  Created by smitha Dharan on 07/08/2022.
//

import Foundation
import UIKit

protocol WeatherHomeViewControllerDelegate {
    func navigateToHomeScreen(_ viewController :WeatherHomeViewController)
}

class WeatherHomeViewController : HomeScreenViewController {
    
    
    @IBOutlet weak var weatherTable: UITableView!
    @IBOutlet weak var nextButton: UIButton!
    
    
    var viewModel : WeatherHomeviewModel?
    var delegate : WeatherHomeViewControllerDelegate?
    
    required init?(coder aDecoder : NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUI()
        self.isModalInPresentation = true
        weak var weakself = self
        Utility.showIndicator(on: self.view)
        self.viewModel?.getCurrentLocation {
            DispatchQueue.main.async {
                weakself?.weatherTable.reloadData()
                Utility.hideIndicator(self.view)
            }
        } onFailure: {(error) in DispatchQueue.main.async {
            Utility.hideIndicator(self.view)
        }
        }
    }
    
    @IBAction func nextBtnPressed(_ sender: Any) {
        delegate?.navigateToHomeScreen(self)
        print("hello")
    }
    
    
}

extension WeatherHomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return (self.viewModel?.dataSource.count ?? 0 > 0) ? 5 : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? WeatherTableViewCell {
            if let vm = self.viewModel {
                cell.setData(model: vm.dataSource[indexPath.row])
                return cell
            }
        }
        return UITableViewCell()
    }
}

extension WeatherHomeViewController: HomeScreenViewControllerProtocol {
    
    func setUpUI() {
        self.title = "WeatherForecast"
        weatherTable.register(UINib(nibName: "WeatherTableViewCell", bundle: nil), forCellReuseIdentifier: Constants.XibIdentifires.homeScreenCell)
        weatherTable.delegate = self
        weatherTable.dataSource = self
        weatherTable.tableFooterView = UIView(frame: .zero)
        weatherTable.backgroundColor = UIColor(red: 137/255, green: 188/255, blue: 215/255, alpha: 1.0)
        weatherTable.separatorColor = UIColor.white
        weatherTable.reloadData()
    }
}
