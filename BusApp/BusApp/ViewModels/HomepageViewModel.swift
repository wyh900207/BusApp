//
//  HomepageViewModel.swift
//  BusApp
//
//  Created by HomerLynn on 2017/10/27.
//  Copyright © 2017年 HomerLynn. All rights reserved.
//

import Foundation

struct HomepageViewModel {
    static let queryHistoryKey = "queryHistory"
    
    var fromCity: String?
    var toCity: String?
    var dateTime: String?
    var queryHistory: Array<String> {
        get {
            if let historys = UserDefaults.standard.value(forKey: HomepageViewModel.queryHistoryKey) as? Array<String> {
                return historys
            }
            return Array()
        }
        set {
            queryHistory = newValue
        }
    }
    
    init() {
        
    }
    
    /// 交换城市
    mutating func exchangeCity() {
        (fromCity, toCity) = (toCity, fromCity)
    }
    
    /// 查询
    mutating func query() {
        insertHistroy()
        // TOOD: 发起请求
    }
    
    /// 插入查询历史
    mutating func insertHistroy() {
        guard let fromCity = fromCity,
            let toCity = toCity else {
            return
        }
        let currentHistory = "\(fromCity)--\(toCity)"
        // 最多保存6条记录
        if queryHistory.count > 6 {
            queryHistory.removeLast()
        }
        queryHistory.insert(currentHistory, at: 0)
        UserDefaults.standard.setValue(currentHistory, forKey: HomepageViewModel.queryHistoryKey)
    }
}
