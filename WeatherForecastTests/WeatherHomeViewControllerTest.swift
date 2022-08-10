//
//  WeatherHomeViewControllerTest.swift
//  WeatherForecastTests
//
//  Created by smitha Dharan on 10/08/2022.
//

import XCTest
@testable import WeatherForecast

class WeatherHomeViewControllerTest: XCTestCase, UITableViewDelegate {
    
    var viewcontroller : ViewController?
    var tableView : UITableView?
    var tableviewCell : WeatherTableViewCell?
    var viewModel : WeatherHomeViewModelTest?
    var delegate : WeatherHomeViewControllerDelegate?
    var dataSource : WeatherTableCellModelTest?
    
    
    override func setUp() {
        let viewcontroller = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as? WeatherHomeViewController
        
        _ = viewcontroller?.view
        
    }
    
    func testCreatetableview() {
        tableView?.register(UINib(nibName: "WeatherTableViewCell", bundle: nil),forCellReuseIdentifier: Constants.XibIdentifires.homeScreenCell)
        tableView?.backgroundColor = .systemBlue
        tableView?.separatorColor = UIColor.white
        tableView?.reloadData()
        
        func testSetdataToTableViewCell() {
            tableviewCell?.lblTitle.text = dataSource?.title
            tableviewCell?.lblSubTitle.text = dataSource?.description
            XCTAssertEqual("clear", tableviewCell?.lblTitle.text)
        }
        
    }
}
