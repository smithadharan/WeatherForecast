//
//  LocationManagerTest.swift
//  WeatherForecastTests
//
//  Created by smitha Dharan on 09/08/2022.
//

import XCTest
import CoreLocation
import RxSwift

@testable import WeatherForecast




class LocationManagerTest: XCTestCase, CLLocationManagerDelegate {
    
    
    var completed = false
    var handleRequestLocation: (() -> CLLocation)?
    
    
    let targetLocation = CLLocation(latitude: 90, longitude: 180)
    
    func testLocation() {
        guard let location = handleRequestLocation?() else { return }
        let sut = LocationManager()
        let manager = CLLocationManager()
        sut.locationManager(manager, didUpdateLocations: [location])
        XCTAssertEqual(location.coordinate.latitude, targetLocation.coordinate.latitude)
        XCTAssertEqual(location.coordinate.longitude, targetLocation.coordinate.longitude)
        XCTAssertTrue(completed)
        
    }
}

