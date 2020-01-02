//
//  User.swift
//  EVTPMobile
//
//  Created by Hoàng Minh Thành on 9/7/19.
//  Copyright © 2019 Viettel Post Joint Stock Corporation. All rights reserved.
//

import Foundation

class User {
    static let shared = User.init()
    var data: UserData = UserData.init(json: "")
    var isLogged: Bool {
        return data.token != nil
    }
    func saveToLocal(_ json: JSON) {
        UserDefaults.standard.setValue(json.rawString(), forKey: AppKeys.userData)
    }
    
    func loadFromLocal() {
        guard let jsonString = UserDefaults.standard.string(forKey: AppKeys.userData) else {
            return
        }
        let user = UserData.init(json: JSON.init(parseJSON: jsonString))
        User.shared.data = user
    }
    
    func removeFromLocal() {
        data = UserData.init(json: "")
        UserDefaults.standard.removeObject(forKey: AppKeys.userData)
    }
}
