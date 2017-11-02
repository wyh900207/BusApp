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

    typealias ButtonConfigClosure = (UIButton) -> Void

    /// All subview in self view.
    lazy var topImageView: UIImageView = UIImageView()
    lazy var middleView: UIView = UIView()

    lazy var fromCityButton: UIButton = UIButton()
    lazy var toCityButton: UIButton = UIButton()
    lazy var datePickButton: UIButton = UIButton()
    lazy var exchangeButton: UIButton = UIButton()
    lazy var queryButton: UIButton = UIButton()

    /// View model
    var homepageVM = HomepageViewModel()

    let buttonConfig: ButtonConfigClosure = { button in
        button.backgroundColor = UIColor.white
        button.titleLabel!.font = UIFont.systemFont(ofSize: 20)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(taped(button:)), for: .touchUpInside)
        button.setTitle("查询", for: .normal)
        button.contentHorizontalAlignment = .left
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "汽车票"
        setupUI()
    }

    /// Config subviews
    fileprivate func setupUI() {
        let screenWidth: CGFloat = UIScreen.main.bounds.size.width
        topImageView
            .config { (imageView: UIImageView) in
                imageView.backgroundColor = .orange
            }
            .add(to: view)
            .layout { maker in
                maker.top.left.right.equalToSuperview()
                maker.height.equalTo(screenWidth * 0.5)
            }
        middleView
            .config { (view: UIView) in
                view.backgroundColor = .yellow
                view.layer.cornerRadius = 10
                view.layer.masksToBounds = true
            }
            .add(to: view)
            .layout { maker in
                maker.top.equalTo(self.topImageView.snp.bottom).offset(-20)
                maker.left.equalToSuperview().offset(10)
                maker.right.equalToSuperview().offset(-10)
            }
        fromCityButton
            .config(config: buttonConfig)
            .config { (button: UIButton) in
                button.setTitle("出发", for: .normal)
                button.tag = 101
            }
            .add(to: middleView)
            .layout { maker in
                maker.top.left.right.equalToSuperview()
                maker.height.equalTo(40)
            }
        toCityButton
            .config(config: buttonConfig)
            .config { (button: UIButton) in
                button.setTitle("到达", for: .normal)
                button.tag = 102
            }
            .add(to: middleView)
            .layout { maker in
                maker.top.equalTo(self.fromCityButton.snp.bottom)
                maker.left.right.height.equalTo(self.fromCityButton)
            }
        datePickButton
            .config(config: buttonConfig)
            .config { (button: UIButton) in
                button.setTitle("11月25日", for: .normal)
                button.tag = 103
            }
            .add(to: middleView)
            .layout { maker in
                maker.top.equalTo(self.toCityButton.snp.bottom)
                maker.left.right.height.equalTo(self.toCityButton)
            }
        exchangeButton
            .config(config: buttonConfig)
            .config { (button: UIButton) in
                button.setImage(nil, for: .normal)
                button.tag = 104
            }
            .add(to: middleView)
        queryButton
            .config(config: buttonConfig)
            .config { (button: UIButton) in
                button.backgroundColor = .GreenColor
                button.setTitleColor(.white, for: .normal)
                button.contentHorizontalAlignment = .center
                button.tag = 105
            }
            .add(to: middleView)
            .layout { maker in
                maker.top.equalTo(self.datePickButton.snp.bottom)
                maker.left.right.height.equalTo(self.datePickButton)
                maker.bottom.equalToSuperview()
            }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

/// Action
extension HomePageViewController {

    @objc fileprivate func taped(button: UIButton) {
        guard let tag = ButtonTag(rawValue: button.tag) else { return }
        switch tag {
        case .from: pickFromCity()
        case .to: pickToCity()
        case .date: pickDate()
        case .exchange: homepageVM.exchangeCity()
        case .query: queryTimeList()
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
    
}

/// Navigation
extension HomePageViewController {
    
    fileprivate func queryTimeList() {
        let desVC = TimeListViewController()
        desVC.fromCity = self.fromCityButton.titleLabel?.text
        desVC.toCity = self.toCityButton.titleLabel?.text
        self.navigationController?.pushViewController(desVC, animated: true)
    }
    
}
