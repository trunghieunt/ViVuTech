//
//  UICollectionView+Extention.swift
//  eVTPMobileV2
//
//  Created by mac on 7/26/19.
//  Copyright © 2019 ViettelPost. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionView {
    func registerCell(_ cellReuseIdentifier: String) {
        self.register(UINib.init(nibName: cellReuseIdentifier, bundle: nil), forCellWithReuseIdentifier: cellReuseIdentifier)
    }
}
