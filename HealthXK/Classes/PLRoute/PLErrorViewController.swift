//
//  PLErrorViewController.swift
//  HealthXK
//
//  Created by 彭磊 on 2019/4/4.
//

import UIKit

public class PLErrorViewController: UIViewController {

    var errorView : UIView? = nil
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        if errorView != nil {
            self.view .addSubview(errorView!)
        }
    }

}
