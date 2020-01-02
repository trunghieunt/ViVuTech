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
import PopupDialog

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
    
    func showAlertOpenSettingLocation() {
        let locationAlertVC = AlertVC.loadFromNib()
        locationAlertVC.titleAlert = "Thông báo".localized()
        locationAlertVC.content = "Ứng dụng cần sử dụng quyền truy cập vị trí. Vui lòng bật lại trong cài đặt".localized()
        locationAlertVC.titleButton = "CÀI ĐẶT".localized()
        locationAlertVC.hideCloseButton = true
        locationAlertVC.confirmHandler = {
            guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
                return
            }
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(settingsUrl, options: [:], completionHandler: nil)
            } else {
                // Fallback on earlier versions
                UIApplication.shared.openURL(settingsUrl)
            }
        }
        let popupVC = PopupDialog.init(viewController: locationAlertVC, tapGestureDismissal: false, panGestureDismissal: false)
        guard let topVC = UIApplication.topViewController() else {
            return
        }
        topVC.present(popupVC, animated: true, completion: nil)
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
