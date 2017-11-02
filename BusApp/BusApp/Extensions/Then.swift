//
//  Then.swift
//  BusApp
//
//  Created by HomerLynn on 2017/11/2.
//  Copyright © 2017年 HomerLynn. All rights reserved.
//

import UIKit
import SnapKit

extension Then where Self: Any {
    
    /// Makes it available to set properties wiht closures just after initialzing and copying value types.
    ///
    ///     let frame = CGRect().with { (rect) in
    ///         rect.origin.x = 10
    ///         rect.size.width = 100
    ///     }
    public func with(_ block: (inout Self) -> Void) -> Self {
        var copy = self
        block(&copy)
        return copy
    }
    
    /// Makes it available to execute something with closure.
    ///
    ///     UserDefaults.standard.do {
    ///         $0.set("value", forKey: "key")
    ///         $0.sychronize()
    ///     }
    public func `do`(_ block: (Self) -> Void) {
        block(self)
    }
    
}

extension Then where Self: AnyObject {
    
    public func then(_ block: (Self) -> Void) -> Self {
        block(self)
        return self
    }
    
}

extension NSObject: Then {}
extension CGPoint: Then {}
extension CGRect: Then {}
extension CGSize: Then {}
extension CGVector: Then {}
extension UIEdgeInsets: Then {}
extension UIOffset: Then {}
extension UIRectEdge: Then {}



extension ViewChainable {
    typealias ConfigClosure = (Self) -> Void
    
    func config(config: ConfigClosure) -> Self {
        config(self)
        return self
    }
}

extension UIView: ViewChainable {
    
    func add(to superView: UIView) -> Self {
        superView.addSubview(self)
        return self
    }

    func layout(snp make: (ConstraintMaker) -> Void) -> Self {
        self.snp.makeConstraints { maker in
            make(maker)
        }
        return self
    }
    
}
