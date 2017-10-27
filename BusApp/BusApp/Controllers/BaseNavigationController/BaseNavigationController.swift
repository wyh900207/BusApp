//
//  BaseNavigationController.swift
//  BusApp
//
//  Created by HomerLynn on 2017/10/26.
//  Copyright © 2017年 HomerLynn. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // 设置导航风格
        navigation(with: .normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
