//
// Created by HomerLynn on 2017/11/2.
// Copyright (c) 2017 HomerLynn. All rights reserved.
//

import UIKit

extension UIColor {

    static let RedColor = UIColor.hex3(0xf00)
    static let GreenColor = UIColor.hex3(0x0f0)
    static let blueColor = UIColor.hex3(0x00f)

    public class func hex3(_ hex3: UInt16, alpha: CGFloat = 1) -> UIColor {
        let divisor = CGFloat(0xF)
        let red     = CGFloat((hex3 & 0xF00) >> 8) / divisor
        let green   = CGFloat((hex3 & 0x0F0) >> 4) / divisor
        let blue    = CGFloat( hex3 & 0x00F      ) / divisor

        return self.init(red: red, green: green, blue: blue, alpha: alpha)
    }

    public class func hex6(_ hex6: UInt32, alpha: CGFloat = 1) -> UIColor {
        let divisor = CGFloat(0xFF)
        let red     = CGFloat((hex6 & 0xFF0000) >> 16) / divisor
        let green   = CGFloat((hex6 & 0x00FF00) >>  8) / divisor
        let blue    = CGFloat( hex6 & 0x0000FF       ) / divisor

        return self.init(red: red, green: green, blue: blue, alpha: alpha)
    }

}
