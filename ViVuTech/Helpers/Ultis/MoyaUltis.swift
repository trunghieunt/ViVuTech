//
//  MoyaUltis.swift
//  EVTPMobile
//
//  Created by Hoàng Minh Thành on 9/7/19.
//  Copyright © 2019 Viettel Post Joint Stock Corporation. All rights reserved.
//

import Foundation
import SwiftyJSON
import Moya
import Result

struct MoyaUltis {
    static func checkRequest(response: Response, success: (JSON) -> Void, hasError: (String) -> Void) {
        do {
            let json = try JSON.init(data: response.data)
            let error = json["error"].boolValue
            if error {
                if json["message"].stringValue == "User của bạn đã đăng nhập trên máy khác!".localized() {
                    IHProgressHUD.dismiss()
                    Ultis.showAlertEndSession()
                    return
                }
                hasError(json["message"].stringValue)
            } else {
                success(json)
            }
        } catch(let error) {
            hasError(error.localizedDescription)
        }
    }
}
