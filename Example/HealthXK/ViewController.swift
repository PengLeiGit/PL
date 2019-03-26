//
//  ViewController.swift
//  HealthXK
//
//  Created by PengLeiGit on 03/26/2019.
//  Copyright (c) 2019 PengLeiGit. All rights reserved.
//

import UIKit
import HealthXK

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let nameLabel = UILabel()
        self.view.addSubview(nameLabel)
        nameLabel.frame = CGRect(x: 10, y: 80, width: self.view.frame.width - 20, height: 30)
        nameLabel.backgroundColor = UIColor.gm_theme
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

