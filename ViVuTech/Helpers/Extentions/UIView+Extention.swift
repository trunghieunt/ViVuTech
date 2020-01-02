//
//  UIView+Extention.swift
//  FootballDaily
//
//  Created by Hoàng Minh Thành on 5/13/19.
//  Copyright © 2019 Hoàng Minh Thành. All rights reserved.
//

//import Foundation
//import UIKit
//
//extension UIView {
//    func addGradient(colors: [CGColor],
//                           locations: [NSNumber]) {
//        //gradient layer
//        let gradientLayer = CAGradientLayer()
//        
//        //define colors
//        gradientLayer.colors = colors
//        
//        //define locations of colors as NSNumbers in range from 0.0 to 1.0
//        //if locations not provided the colors will spread evenly
//        gradientLayer.locations = locations
//        
//        //define frame
//        gradientLayer.frame = self.bounds
//        
//        //insert the gradient layer to the view layer
//        self.layer.insertSublayer(gradientLayer, at: 0)
//    }
//    
//    func addShadow(shadowOffset: CGSize, shadowRadius: CGFloat, color: UIColor, shadowOpacity: Float) {
//        self.layer.shadowOffset = shadowOffset
//        self.layer.shadowRadius = shadowRadius
//        self.layer.shadowColor = color.cgColor
//        self.layer.shadowOpacity = shadowOpacity
//    }
//    
//    func addShadow(offset: CGSize, color: UIColor, radius: CGFloat, opacity: Float) {
//        layer.masksToBounds = false
//        layer.shadowOffset = offset
//        layer.shadowColor = color.cgColor
//        layer.shadowRadius = radius
//        layer.shadowOpacity = opacity
//        
//        let backgroundCGColor = backgroundColor?.cgColor
//        backgroundColor = nil
//        layer.backgroundColor =  backgroundCGColor
//    }
//    
//    func addBottomBorderWithColor(color: UIColor, width: CGFloat) {
//        let border = CALayer()
//        border.backgroundColor = color.cgColor
//        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: width)
//        self.layer.addSublayer(border)
//    }
//    
//    func addTopBorderWithColor(color: UIColor, width: CGFloat) {
//        let border = CALayer()
//        border.backgroundColor = color.cgColor
//        print(self.frame.size.width)
//        border.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: width)
//        self.layer.addSublayer(border)
//    }
//    
//    func addLeftBorderWithColor(color: UIColor, width: CGFloat) {
//        let border = CALayer()
//        border.backgroundColor = color.cgColor
//        border.frame = CGRect(x:0, y:4, width: width, height: self.frame.size.height - 8)
//        self.layer.addSublayer(border)
//    }
//    
//    func addBorder(_ color : UIColor, width: CGFloat, cornerRadius: CGFloat) {
//        let border = CALayer()
//        border.borderWidth = width
//        border.borderColor = color.cgColor
//        border.cornerRadius = cornerRadius
//        border.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
//        self.layer.addSublayer(border)
//    }
//    
//    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
//        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
//        let mask = CAShapeLayer()
//        mask.path = path.cgPath
//        self.layer.mask = mask
//    }
//}
