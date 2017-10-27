//
//  ThemeStyle.swift
//  BusApp
//
//  Created by HomerLynn on 2017/10/26.
//  Copyright © 2017年 HomerLynn. All rights reserved.
//

import UIKit

struct Theme {
    enum ThemeStyle {
        case normal
    }
    
    typealias Attributs = Dictionary<NSAttributedStringKey, Any>
    
    // 导航栏背景色
    var tintColor: UIColor
    // 导航标题
    var titleTextAttributes: Attributs
    // 返回按钮
    var appenceTintColor: UIColor

    init(with theme: ThemeStyle) {
        switch theme {
        case .normal:
            self.tintColor = UIColor(
                red: 0,
                green: 143/255.0,
                blue: 241/255.0, alpha: 1)
            self.titleTextAttributes =
                [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 20),
                 NSAttributedStringKey.foregroundColor: UIColor.white]
            self.appenceTintColor = UIColor.white
        }
    }
    
}
