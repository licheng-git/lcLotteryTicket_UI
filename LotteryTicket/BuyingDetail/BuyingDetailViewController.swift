//
//  BuyingDetailViewController.swift
//  LotteryTicket
//
//  Created by Cheng Li on 2017/10/31.
//  Copyright © 2017年 李诚. All rights reserved.
//

import UIKit

class BuyingDetailViewController: UIViewController {
    
    var detailId = String()
    
    lazy var navTitleView: bdNavTitleView = {
        let view = bdNavTitleView()
        return view
    } ()
    
    lazy var navTitleDetailView: bdNavTitleDetailView = {
        let view = bdNavTitleDetailView()
        return view
    } ()
    
    let lbText: UILabel = {
        let lb = UILabel()
        lb.textAlignment = .center
        lb.font = UIFont.systemFont(ofSize: 16)
        return lb
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addDefaultBackNavItem()
        self.navigationItem.titleView = self.navTitleView.btnTitle
        self.navTitleView.cBtnClick_Toggle = { [weak self] (_ bToShow: Bool) -> () in
            if bToShow {
                self?.view.addSubview((self?.navTitleDetailView)!)
                self?.navTitleDetailView.snp.makeConstraints({ (make) in
                    make.top.equalToSuperview().offset(kDEFAULT_MARGIN_Y)
                    make.left.right.bottom.equalToSuperview()
                })
            }
            else {
                self?.navTitleDetailView.removeFromSuperview()
            }
        }
        self.navTitleDetailView.cBgViewTap = { [weak self] in
            self?.navTitleView.btnTitle.isSelected = false
        }
        self.navTitleDetailView.cBtnClick = { [weak self] (_ btnTitle: String) -> () in
            self?.navTitleView.btnTitle.isSelected = false
            self?.navTitleView.btnTitle.setTitle(btnTitle, for: .normal)
        }
        self.navTitleView.btnTitle.setTitle("定位胆", for: .normal)
        
        let navItem_right = UIBarButtonItem()
        navItem_right.style = .plain
        navItem_right.image = UIImage(named: "navItem_menu")
        navItem_right.target = self
        navItem_right.action = #selector(navItemClick_Right(_:))
        navItem_right.tintColor = UIColor.white
        self.navigationItem.rightBarButtonItem = navItem_right
        
        self.lbText.text = self.detailId
        
        self.view.addSubview(self.lbText)
        self.lbText.snp.makeConstraints { (make) in
            make.centerX.centerY.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalTo(50)
        }
    }
    
    @objc private func navItemClick_Right(_ sender: UIBarButtonItem) {
    }
    
    deinit {
        print("BuyDetailViewController deinit")
    }
    
}
