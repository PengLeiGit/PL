//
//  UIViewController+Route.swift
//  HealthXK
//
//  Created by 彭磊 on 2019/4/4.
//

import Foundation
import UIKit

fileprivate func getClassName(_ obj:Any) -> String {
    let mirro = Mirror(reflecting: obj)
    let className = String(describing: mirro.subjectType).components(separatedBy: ".").first!
    return className
}


// 前进
extension UIViewController {
    
    // 页面的push跳转
    public func JKPush(to targetViewController: UIViewController, isHiddenBottomBarWhenBack: Bool = true, animated:Bool = true) {
        
        if self.navigationController == nil {
            self.present(targetViewController, animated: true, completion: nil)
        } else {
            
            let vc = getClassName(self)
            
            //如果目标控制器是一级页面，pop或dismiss后重新创建rootController
            
            if PLRoute.shared.subControllers.contains(vc) {
                self.hidesBottomBarWhenPushed = true
                self.navigationController?.pushViewController(targetViewController, animated: animated)
                self.hidesBottomBarWhenPushed = false
            } else {
                self.hidesBottomBarWhenPushed = true
                self.navigationController?.pushViewController(targetViewController, animated: animated)
                self.hidesBottomBarWhenPushed = isHiddenBottomBarWhenBack
            }
        }
    }
}


// 返回
extension UIViewController {
    
    public func JKBack(toTabBarIndex index:Int = 0) {
        PLRoute.shared.tabBar?.selectedIndex = index
        
        if navigationController != nil {
            if (navigationController?.viewControllers.count)! > 1 {
                navigationController?.popToRootViewController(animated: true)
                return
            }
        }
    }
    
    public func JKBackHandle(_ viewController: UIViewController? = nil) {
        
        var targetViewController : String?
        
        if viewController != nil {
            targetViewController = getClassName(viewController!)
        }
        
        //如果没有目标控制器，直接走返回方法
        guard targetViewController != nil else {
            
            if navigationController == nil {
                dismiss(animated: true, completion: nil)
            } else {
                if (navigationController?.viewControllers.count)! > 1 {
                    navigationController?.popViewController(animated: true)
                    return
                }
                
                if ((navigationController?.presentingViewController) != nil) {
                    navigationController?.dismiss(animated: true, completion: nil)
                } else {
                    navigationController?.popViewController(animated: true)
                }
            }
            
            return
        }
        
        //如果目标控制器存在于当前navigationController的stack中，直接pop
        for vc: UIViewController in (navigationController?.viewControllers)! {
            if getClassName(vc) == targetViewController {
                navigationController?.popToViewController(vc, animated: true)
                return
            }
        }
        
        
        
        //如果目标控制器是一级页面，pop或dismiss后重新创建rootController
        
        if PLRoute.shared.subControllers.contains(targetViewController ?? "") {
            if ((navigationController?.presentingViewController) != nil) {
                navigationController?.dismiss(animated: true, completion: nil)
                PLRoute.shared.rootController()
            }else {
                navigationController?.popToRootViewController(animated: true)
                PLRoute.shared.rootController()
            }
            return
        }
        
        
        //如果目标控制器不是一级页面，也不在当前navigationController的stack中，
        iterativeNavigation(targetViewController!, navigationController!) { (vc, presentingNav, presentedNav) in
            if presentingNav.viewControllers.last != vc {
                presentedNav.dismiss(animated: false, completion: {
                    presentingNav.popToViewController(vc, animated: true)
                })
            }else {
                presentedNav.dismiss(animated: true)
            }
        }
    }
    
    private typealias PresentingNav = UINavigationController
    private typealias PresentedNav = UINavigationController
    
    private func iterativeNavigation(_ targetViewController: String, _ nav: UINavigationController, handle:@escaping (UIViewController, PresentingNav, PresentedNav) -> ()) {
        if let presentingNavigation = nav.presentingViewController as? UINavigationController {
            for vc: UIViewController in presentingNavigation.viewControllers {
                if getClassName(vc) == targetViewController {
                    handle(vc, presentingNavigation, nav)
                    return
                }
            }
            if nav.presentingViewController != nil {
                nav.dismiss(animated: false, completion: {
                    self.iterativeNavigation(targetViewController,presentingNavigation, handle: handle)
                })
            }
        }else {
            print("route something wrong!")
        }
    }
    
    
}


