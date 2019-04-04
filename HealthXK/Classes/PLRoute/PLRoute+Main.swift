//
//  PLRoute+Main.swift
//  HealthXK
//
//  Created by 彭磊 on 2019/4/4.
//

import UIKit

extension PLRoute {
    public func initRootController(subControllers:[UIViewController]) -> UITabBarController {
        let view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = UIColor.lightGray
        configErrorController(view)
        tabBar = PLTabBarController(subControllers: subControllers)
        configRootController(tabBar!)
        return tabBar!
    }
    
    
    public static func setupItem(_ title: String,
                                 _ image: UIImage?,
                                 _ selectedImage: UIImage?,
                                 _ titleNormalColor: UIColor,
                                 _ titleSelectClor: UIColor) -> UITabBarItem
    {
        let item = UITabBarItem(title: title, image: image?.withRenderingMode(.alwaysOriginal), selectedImage: selectedImage?.withRenderingMode(.alwaysOriginal))
        item.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : titleNormalColor], for: .normal)
        item.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : titleSelectClor], for: .selected)
        return item
    }
}
