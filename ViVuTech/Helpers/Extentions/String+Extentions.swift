//
//  String+Extentions.swift
//  FaMob
//
//  Created by Hoàng Minh Thành on 9/14/18.
//  Copyright © 2018 Hoàng Minh Thành. All rights reserved.
//

import Foundation
import Moya

extension String {
    func replace(target: String, withString: String) -> String {
        return self.replacingOccurrences(of: target, with: withString, options: NSString.CompareOptions.literal, range: nil)
    }
    
    /// Bỏ dấu câu của text
    func unsignedString() -> String {
        let mutableString = NSMutableString(string: self) as CFMutableString
        CFStringTransform(mutableString, nil, kCFStringTransformStripCombiningMarks, false)
        let normalized = (mutableString as NSMutableString).copy() as! String
        return normalized
    }
    
    func smartContains(_ other: String) -> Bool {
        let array : [String] = other.lowercased().components(separatedBy: " ").filter { !$0.isEmpty }
        return array.reduce(true) { !$0 ? false : (self.lowercased().range(of: $1) != nil ) }
    }
    
    func convertStringToStringMoney() -> String {
        if let value = Double(self) {
            let formatter = NumberFormatter()
            formatter.numberStyle = .currency
            formatter.locale = Locale(identifier: "en_US")
            formatter.maximumFractionDigits = 0
            if let str = formatter.string(for: value) {
                return String(str.dropFirst()) + " đ"
            }
        }
        return ""
    }
    
    
    func convertStringToStringDate(_ dateFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        let datestr = dateFormatter.date(from: self)
        let interval = Calendar.current.dateComponents([.minute, .hour, .day], from: datestr!, to: Date())
        if let day = interval.day, day > 0{
            return "\(day) " + "day ago".localized()
        }else if let hour = interval.hour, hour > 0{
            return "\(hour) " + "hour ago".localized()
        }else if let minute = interval.minute{
            return "\(minute) " + "minute ago".localized()
        }else {
            return "a moment ago".localized()
            
        }
    }
    
    func linespace(_ spacing: CGFloat) -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(string: self)
        
        // *** Create instance of `NSMutableParagraphStyle`
        let paragraphStyle = NSMutableParagraphStyle()
        
        // *** set LineSpacing property in points ***
        paragraphStyle.lineSpacing = spacing // Whatever line spacing you want in points
        
        // *** Apply attribute to string ***
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
        
        return attributedString
    }
    
    func isValidPhoneVN() -> Bool {
        var newInput = self.components(separatedBy: " ").joined(separator: "")
        if newInput.prefix(3) == "+84"{
            newInput.removeFirst(3)
            newInput = "0" + newInput
        }
        let PHONE_REGEX = "^(05|03|04|07|08|01[2689]|09|024|028)[0-9]{8}$|(021[012345689]|023[23456789]|020[3456789]|022[0123456789]|029[01234679]|025[123456789]|026[01239]|027[01234567])[0-9]{7}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        return phoneTest.evaluate(with: newInput)
    }

    
    var vietnamPhone: String {
        if self.starts(with: "84") {
            return self.replace(target: "84", withString: "0")
        } else if self.count == 9 && self.starts(with: "0") == false {
            return "0\(self)"
        }
        return self
    }
    
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    var utf8Encoded: Moya.Data {
        return data(using: .utf8)!
    }

}
