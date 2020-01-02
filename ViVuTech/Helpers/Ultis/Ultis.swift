//
//  Ultis.swift
//  EVTPMobile
//
//  Created by Hoàng Minh Thành on 9/7/19.
//  Copyright © 2019 Viettel Post Joint Stock Corporation. All rights reserved.
//

import Foundation

struct Ultis {
    
    static func logout() {
        User.shared.removeFromLocal()
        if let fcmToken = UserDefaults.standard.string(forKey: AppKeys.fcmToken) {
            NotificationWorker.unRegisterDevice(fcmToken)
            UserDefaults.standard.removeObject(forKey: AppKeys.fcmToken)
        }
        let loginVC = LoginVC.loadFromNib()
        ViewPresenter.replaceRootView(for: loginVC, duration: 0.3, options: .transitionCrossDissolve, completion: nil)
    }
}
