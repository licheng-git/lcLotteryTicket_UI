//
//  BuyingDetailViewController.swift
//  LotteryTicket
//
//  Created by Cheng Li on 2017/10/31.
//  Copyright © 2017年 李诚. All rights reserved.
//

import UIKit

class BuyingDetailViewController: UIViewController {
    
    lazy var navTitleView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.green
        view.frame = CGRect(x: 10, y: 10, width: 100, height: 30)
        return view
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addDefaultBackNavItem()
        self.navigationItem.titleView = self.navTitleView
        self.view.backgroundColor = UIColor.orange
    }
    
}
