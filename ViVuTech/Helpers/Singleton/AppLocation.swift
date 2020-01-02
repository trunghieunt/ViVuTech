//
//  AppLocation.swift
//  EVTPMobile
//
//  Created by Hoàng Minh Thành on 9/9/19.
//  Copyright © 2019 Viettel Post Joint Stock Corporation. All rights reserved.
//

import Foundation
import CoreLocation
import UIKit

class AppLocation: NSObject {
    
    static let shared = AppLocation.init()
    
    fileprivate var locationManager = CLLocationManager.init()
    
    func updateLocation() {
        checkLocationServicesEnabled()
        NotificationCenter.default.addObserver(self, selector: #selector(checkLocationServicesEnabled), name: UIApplication.didBecomeActiveNotification, object: nil)
        locationManager.requestAlwaysAuthorization()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
    }
    
    @objc func checkLocationServicesEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            switch CLLocationManager.authorizationStatus() {
            case .restricted, .denied:
                showAlertOpenSettingLocation()
            case .authorizedAlways, .authorizedWhenInUse:
                print("Access")
            default:
                break
            }
        } else {
            print("Location services are not enabled")
        }
    }
}

extension AppLocation: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {
            return
        }
        print("lat: \(location.coordinate.latitude)    long: \(location.coordinate.longitude)")
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}
