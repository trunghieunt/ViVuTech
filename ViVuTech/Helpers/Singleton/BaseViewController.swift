//
//  BaseViewController.swift
//  EVTPMobile
//
//  Created by Hoàng Minh Thành on 9/7/19.
//  Copyright © 2019 Viettel Post Joint Stock Corporation. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNeedsStatusBarAppearanceUpdate()
        configNavigationBarStyle()
    }
    
    func configNavigationBarStyle() {
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "bg_navi")?.stretchableImage(withLeftCapWidth: 1, topCapHeight: 1), for: .default)
        self.navigationController?.navigationBar.backIndicatorImage = UIImage.init()
        self.navigationItem.backBarButtonItem = UIBarButtonItem.init(title: "", style: .plain, target: nil, action: nil)
        self.view.backgroundColor = AppColors.backgrounDefault
    }
}
