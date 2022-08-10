//
//  DependencyAssembler.swift
//  WeatherForecast
//
//  Created by smitha Dharan on 07/08/2022.
//

import UIKit

class DependencyAssembler {
    static let shared = DependencyAssembler()
    
    private init() {}
    
    var networkManager: NetworkManagerProtocol?
    
    
    lazy var weatherViewRepository = WeatherHomeViewrepositary(networkManager: networkManager)
    
    lazy var detailedRepository = DetailedViewRepositary(networkManager: networkManager)
}

extension DependencyAssembler: WeatherHomeFactory {
    func makeWeatherHomeViewCoordinator(router: Router, factory: WeatherHomeFactory) -> WeatherHomeViewCoordinator? {
        let coordinator = WeatherHomeViewCoordinator(router: router,
                                                     factory: factory)
        return coordinator
    }
    
    
    func makeWeatherHomeViewModel(coordinator: WeatherHomeViewCoordinator) -> WeatherHomeviewModel {
        let viewModel = WeatherHomeviewModel(repository: weatherViewRepository)
        return viewModel
    }
    
    
    func makeWeatherHomeViewController(coordinator: WeatherHomeViewCoordinator) -> WeatherHomeViewController? {
        if let viewController = UIStoryboard.load(from: .main,
                                                  identifier:Constants.StoryboardsIds.HomeScreen) as? WeatherHomeViewController {
            viewController.delegate = coordinator
            viewController.viewModel = self.makeWeatherHomeViewModel(coordinator: coordinator)
            return viewController
        }
        
        return nil
    }
}

extension DependencyAssembler: DetailedViewFactory {
    func makeDetailedViewCoordinator(router: Router, factory: DetailedViewFactory) -> DetailedViewCoordinator? {
        let coordinator = DetailedViewCoordinator(router: router,
                                                  factory: factory)
        return coordinator
    }
    
    func makeDetailedViewModel(coordinator: DetailedViewCoordinator) -> DetailedViewModel {
        let viewModel = DetailedViewModel(repository: detailedRepository)
        return viewModel
    }
    
    func makeDetailedViewController(coordinator: DetailedViewCoordinator) -> DetailedViewController? {
        if let viewController = UIStoryboard.load(from: .main,
                                                  identifier:Constants.StoryboardsIds.NextScreen) as? DetailedViewController {
            viewController.delegate = coordinator
            viewController.viewModel = self.makeDetailedViewModel(coordinator: coordinator)
            viewController.delegate = coordinator
            return viewController
        }
        
        return nil
    }
    
}
