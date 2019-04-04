//
//  PLNavigationController.swift
//  HealthXK
//
//  Created by 彭磊 on 2019/4/4.
//

import UIKit

class PLNavigationController: UINavigationController, UIGestureRecognizerDelegate, UINavigationControllerDelegate {

    override open func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        weak var weakSelf = self
        if responds(to: #selector(getter: interactivePopGestureRecognizer)) {
            interactivePopGestureRecognizer?.delegate = weakSelf
        }
        setup()
    }
    
    private func setup() {
        navigationBar.isTranslucent = false
    }
    
    override open func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: animated)
        if navigationBar.isHidden {
            setNavigationBarHidden(false, animated: false)
        }
        
        if responds(to: #selector(getter: interactivePopGestureRecognizer)) {
            interactivePopGestureRecognizer?.isEnabled = false
        }
    }
    
    public func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        if navigationController.responds(to: #selector(getter: interactivePopGestureRecognizer)) {
            navigationController.interactivePopGestureRecognizer?.isEnabled = true
        }
    }
    
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if children.count == 1 {
            return false
        }
        return true
    }

}
