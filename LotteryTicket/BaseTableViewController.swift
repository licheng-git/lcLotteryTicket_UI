//
//  BaseTableViewController.swift
//  LotteryTicket
//
//  Created by Cheng Li on 2017/11/3.
//  Copyright © 2017年 李诚. All rights reserved.
//

import UIKit
import SnapKit

class BaseTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    lazy var myTableview: UITableView = {
        //let tableview = UITableView(frame: CGRect.zero, style: .plain)
        let tableview = UITableView()
        tableview.backgroundColor = UIColor.white
        tableview.dataSource = self
        tableview.delegate = self
        tableview.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "CellId")    // tableview.register(myTableCell.classForCoder(), forCellReuseIdentifier: "CellId")
        tableview.separatorStyle = .none
        return tableview
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        self.view.addSubview(self.myTableview)
        self.myTableview.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(kDEFAULT_MARGIN_Y)
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(-kBOTTOM_HEIGHT)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0    // return self.vm.arrModels.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 0    // return myTableCell.myHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath)    // as! myTableCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        //let cell = tableView.cellForRow(at: indexPath)
    }

}

