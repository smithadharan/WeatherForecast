//
//  DetailedViewCoordinator.swift
//  WeatherForecast
//
//  Created by smitha Dharan on 07/08/2022.
//

import Foundation

class DetailedViewCoordinator: Coordinator {
    
    
    var children: [Coordinator] = []
    
    var router: Router
    
    private let factory: DetailedViewFactory
    
    init(router: Router,
         factory: DetailedViewFactory) {
        self.router = router
        self.factory = factory
    }
    
    func present(animated: Bool, onDismissed: (() -> Void)?) {
        if let detailedViewController = factory.makeDetailedViewController(coordinator: self) {
            router.present(detailedViewController,
                           animated: true,
                           onDismissed: nil)
        }
    }
    func dismiss(animated: Bool) {
        
    }
    
    
}

extension DetailedViewCoordinator: DetailedViewControllerDelegate {
    
    func backButtonPressed() {
        self.router.dismiss(animated: true)
    }
    
}
