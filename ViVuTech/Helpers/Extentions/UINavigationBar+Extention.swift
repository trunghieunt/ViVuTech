//
//  UINavigationBar+Extention.swift
//  eVTPMobileV2
//
//  Created by Hoàng Minh Thành on 7/17/19.
//  Copyright © 2019 ViettelPost. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationBar {
    func addGradient(_ toAlpha: CGFloat, _ color: UIColor) {
        let gradient = CAGradientLayer()
        gradient.colors = [
            color.withAlphaComponent(toAlpha).cgColor,
            color.withAlphaComponent(toAlpha).cgColor,
            color.withAlphaComponent(0).cgColor
        ]
        gradient.locations = [0, 0.8, 1]
        var frame = bounds
        frame.size.height += UIApplication.shared.statusBarFrame.size.height
        frame.origin.y -= UIApplication.shared.statusBarFrame.size.height
        gradient.frame = frame
        layer.insertSublayer(gradient, at: 1)
    }
}
