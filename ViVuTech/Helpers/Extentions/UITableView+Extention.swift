//
//  UITableView+Extention.swift
//  FootballDaily
//
//  Created by Hoàng Minh Thành on 5/13/19.
//  Copyright © 2019 Hoàng Minh Thành. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    func registerCell(_ cellReuseIdentifier: String) {
        self.register(UINib.init(nibName: cellReuseIdentifier, bundle: nil), forCellReuseIdentifier: cellReuseIdentifier)
    }
    
    func scrollToBottom() {
        guard self.numberOfRows(inSection: 0) > 0 else {
            return
        }
        DispatchQueue.main.async {
            guard self.numberOfSections > 0, self.numberOfRows(inSection: self.numberOfSections-1) > 0 else {
                return
            }
            let indexPath = IndexPath.init(row: self.numberOfRows(inSection: self.numberOfSections-1)-1, section: self.numberOfSections-1)
            self.scrollToRow(at: indexPath, at: .bottom, animated: true)
        }
    }
}
