//
//  MoyaProvider.swift
//  EVTPMobile
//
//  Created by Hoàng Minh Thành on 9/7/19.
//  Copyright © 2019 Viettel Post Joint Stock Corporation. All rights reserved.
//

import Foundation
//import Alamofire
import Moya

//struct Provider {
//    static let sharedManager: Alamofire.SessionManager = {
//        let configuration = URLSessionConfiguration.default
//        configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
//        configuration.timeoutIntervalForRequest = 30 // as seconds, you can set your request timeout
//        configuration.timeoutIntervalForResource = 30 // as seconds, you can set your resource timeout
//        let manager = Alamofire.SessionManager(configuration: configuration)
//        manager.adapter = CustomRequestAdapter()
//        return manager
//    }()
//}

private class CustomRequestAdapter: RequestAdapter {
    public func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
        var urlRequest = urlRequest
        urlRequest.setValue("XMLHttpRequest", forHTTPHeaderField: "X-Requested-With")
        return urlRequest
    }
}
