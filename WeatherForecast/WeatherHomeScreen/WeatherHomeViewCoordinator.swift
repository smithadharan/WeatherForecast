//
//  WeatherHomeViewCoordinator.swift
//  WeatherForecast
//
//  Created by smitha Dharan on 07/08/2022.
//

import Foundation

public class WeatherHomeViewCoordinator: Coordinator {
    
    public var children: [Coordinator] = []
    
    public var router: Router
    
    private let factory: WeatherHomeFactory
    
    init(router: Router, factory: WeatherHomeFactory) {
        self.router = router
        self.factory = factory
    }
    
    
    
    public func dismiss(animated: Bool) {
        
    }
    
    
    public func present(animated: Bool, onDismissed onDissmissed:(() -> Void)?){
        if let homeViewController = factory.makeWeatherHomeViewController(coordinator: self){
            router.present(homeViewController,
                           animated: true,
                           onDismissed: nil)
        }
    }
    
    func addChildCoordinator(_coordinator: Coordinator){
        
    }
    
    func removeAllChildCoordinatorsWith<T>(type: T.Type){
        
    }
    
    func removeAllChildCoordinator() {
        
    }
}

extension WeatherHomeViewCoordinator: WeatherHomeViewControllerDelegate {
    func navigateToHomeScreen(_ viewController: WeatherHomeViewController) {
        if let navCotroller = viewController.navigationController {
            let router = NavigationRouter(navigationController: navCotroller)
            let assembler = DependencyAssembler.shared
            let coordinator = assembler.makeDetailedViewCoordinator(router: router, factory: assembler)
            guard let coordinator = coordinator else {
                return
            }
            presentChild(coordinator,
                         animated: true,
                         onDismissed: nil)
        }
    }
    
}
