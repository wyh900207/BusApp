//
//  HomePageViewController.swift
//  BusApp
//
//  Created by HomerLynn on 2017/10/27.
//  Copyright © 2017年 HomerLynn. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController {
    enum ButtonTag: Int {
        case from = 101, to, date, exchange, query
    }
    
    static let querySegue = "querySegue"

    @IBOutlet weak var fromCityButton: UIButton!
    @IBOutlet weak var toCityButton: UIButton!
    @IBOutlet weak var datePickButton: UIButton!
    @IBOutlet weak var exchangeButton: UIButton!
    @IBOutlet weak var queryButton: UIButton!
    
    var homepageVM = HomepageViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier,
            let timelistVC = segue.destination as? TimeListViewController,
            identifier == HomePageViewController.querySegue {
            timelistVC.fromCity = homepageVM.fromCity
            timelistVC.toCity = homepageVM.toCity
        }
    }

    fileprivate func pickFromCity() {
        print("出发")
    }
    
    fileprivate func pickToCity() {
        print("到达")
    }
    
    fileprivate func pickDate() {
        print("日期")
    }
    
    fileprivate func queryTimeList() {
        performSegue(withIdentifier: HomepageViewModel.queryHistoryKey, sender: self)
    }
    
    @IBAction func taped(button: UIButton) {
        guard let tag = ButtonTag(rawValue: button.tag) else { return }
        switch tag {
        case .from: pickFromCity()
        case .to: pickToCity()
        case .date: pickDate()
        case .exchange: homepageVM.exchangeCity()
        case .query: queryTimeList()
        }
    }
}
