//
//  PLTabBarController.swift
//  HealthXK
//
//  Created by 彭磊 on 2019/4/4.
//

import UIKit

class PLTabBarController: UITabBarController, UITabBarControllerDelegate {

    override public func viewDidLoad() {
        super.viewDidLoad()
        tabBar.barTintColor = UIColor.white
        tabBar.isTranslucent = false
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    init(subControllers: [UIViewController]) {
        super.init(nibName: nil, bundle: nil)
        viewControllers = subControllers
        delegate = self
        selectedIndex = 0
        tabBar.barTintColor = UIColor.white
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }
    
    private func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
    }

}
