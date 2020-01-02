//
//  ViewController-Extention.swift
//  WorldCup2018
//
//  Created by Hoàng Minh Thành on 5/4/18.
//  Copyright © 2018 Hoàng Minh Thành. All rights reserved.
//

import Foundation
import UIKit
import Toast_Swift

extension UIViewController {
    class func loadFromNib() -> Self {
        func loadFromNib<T: UIViewController>(_ viewType: T.Type) -> T {
            return T.init(nibName: String(describing: T.self), bundle: nil)
        }
        return loadFromNib(self)
    }
    
    @objc func popViewController() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func scrollToTop() {
        func scrollToTop(view: UIView?) {
            guard let view = view else { return }
            
            switch view {
            case let scrollView as UIScrollView:
                if scrollView.scrollsToTop == true {
                    scrollView.setContentOffset(CGPoint(x: 0.0, y: -scrollView.contentInset.top), animated: true)
                    return
                }
            default:
                break
            }
            
            for subView in view.subviews {
                scrollToTop(view: subView)
            }
        }
        
        scrollToTop(view: self.view)
    }
    
    func showToast(position: ToastPosition, message: String) {
        var style = ToastStyle.init()
        style.backgroundColor = .black
        style.messageColor = .white
        self.view.makeToast(message, duration: 3.0, position: position, style: style)
    }
    
    func showToastAtBottom(message: String) {
        var style = ToastStyle.init()
        style.backgroundColor = .black
        style.messageColor = .white
        self.view.makeToast(message, duration: 3.0, position: .bottom, style: style)
    }
    
    func showLoading() {
        IHProgressHUD.show()
    }
    
    func hideLoading() {
        IHProgressHUD.dismiss()
    }
}
