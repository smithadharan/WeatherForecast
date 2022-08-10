//
//  LocationManager.swift
//  WeatherForecast
//
//  Created by smitha Dharan on 07/08/2022.
//

import Foundation
import CoreLocation
import RxSwift

final class LocationManager: NSObject {
    
    var location = PublishSubject<CLLocation>()
    
    static let shared = LocationManager()
    
    private lazy var manager: CLLocationManager = {
        let manager = CLLocationManager()
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.distanceFilter = 200
        manager.delegate = self
        manager.requestAlwaysAuthorization()
        return manager
    }()
    
    func startUpdatingLocation(){
        self.manager.startUpdatingLocation()
    }
    
    func stopUpdatingLocation(){
        self.manager.stopUpdatingLocation()
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager,
                         didUpdateLocations locations: [CLLocation]) {
        guard let mostRecentLocation = locations.last else {
            return
        }
        self.location.onNext(mostRecentLocation)
        self.stopUpdatingLocation()
        manager.delegate = nil
    }
    
    func locationManager(_ manager: CLLocationManager,
                         didFailWithError error: Error) {
        print(error)
        self.location.dispose()
    }
}
