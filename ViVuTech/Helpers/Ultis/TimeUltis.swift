//
//  TimeUltis.swift
//  eVTPMobileV2
//
//  Created by mac on 7/31/19.
//  Copyright © 2019 ViettelPost. All rights reserved.
//

//import Foundation
//
//class TimeUltis {
//    class func convertTimestampToString(unixtimeInterval: Double, format: String) -> String {
//        let date = Date(timeIntervalSince1970: unixtimeInterval)
//        let dateFormatter = DateFormatter()
//        //dateFormatter.timeZone = TimeZone(abbreviation: "GMT") //Set timezone that you want
//        //dateFormatter.locale = NSLocale.current
//        dateFormatter.dateFormat = format //Specify your format that you want
//        return dateFormatter.string(from: date)
//    }
//    
//    class func convertDateToString(date: Date, format: String) -> String {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = format
//        return dateFormatter.string(from: date)
//    }
//    
//    class func convertStringToTimestamp(strdate: String, format: String) -> Int {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = format
//        let date = dateFormatter.date(from: strdate)
//        let dateStamp:TimeInterval = date!.timeIntervalSince1970
//        return Int(dateStamp)
//    }
//}
//
//extension Date {
//    var millisecondsSince1970:Int {
//        return Int((self.timeIntervalSince1970 * 1000.0).rounded())
//        //  return Int(self.timeIntervalSince1970 * 1000.0)
//    }
//    
//    init(milliseconds:Int) {
//        self = Date(timeIntervalSince1970: TimeInterval(milliseconds) / 1000)
//    }
//}
