//
//  UINavigationController.swift
//  BusApp
//
//  Created by HomerLynn on 2017/10/26.
//  Copyright © 2017年 HomerLynn. All rights reserved.
//

import UIKit

extension UINavigationController: NavigationControllerProtocol {
    func navigation(with themeStyle: Theme.ThemeStyle) {
        let theme = Theme(with: themeStyle)
        navigationBar.barTintColor = theme.tintColor
        navigationBar.titleTextAttributes = theme.titleTextAttributes
        UINavigationBar.appearance().tintColor = theme.appenceTintColor
    }
}
