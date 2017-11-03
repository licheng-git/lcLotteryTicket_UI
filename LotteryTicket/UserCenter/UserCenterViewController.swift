//
//  UserCenterViewController.swift
//  LotteryTicket
//
//  Created by 李诚 on 17/10/26.
//  Copyright © 2017年 李诚. All rights reserved.
//

import UIKit

class UserCenterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let vm = UserCenter_ViewModel()
    
    lazy var headerView: ucHeaderView = {
        let view = ucHeaderView()
        return view
    } ()
    
    lazy var ucTableview: UITableView = {
        //let tableview = UITableView(frame: CGRect.zero, style: .plain)
        let tableview = UITableView()
        tableview.backgroundColor = kBgColorGray
        tableview.dataSource = self
        tableview.delegate = self
        tableview.register(ucTableCell.classForCoder(), forCellReuseIdentifier: "CellId")
        //tableview.separatorStyle = .none
        return tableview
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "卡司秀彩票"
        self.view.backgroundColor = kBgColorGray
        self.automaticallyAdjustsScrollViewInsets = false
        self.view.addSubview(self.headerView)
        self.headerView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(kDEFAULT_MARGIN_Y)
            make.left.right.equalToSuperview()
            make.height.equalTo(ucHeaderView.ucHeight)
        }
        self.view.addSubview(self.ucTableview)
        self.ucTableview.snp.makeConstraints { (make) in
            make.top.equalTo(self.headerView.snp.bottom).offset(10)
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(-kBOTTOM_HEIGHT)
        }
        
        self.vm.getCellData()
        self.vm.getHeaderData { [weak self] (model) in
            self?.headerView.imgviewHeader.image = UIImage(named: model.headerImgName!)
            self?.headerView.lbAccount.text = model.account
            self?.headerView.lbAmount.text = model.amount
            self?.headerView.lbTodayProfit.text = model.todayProfit
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let allCellsHeight = ucTableCell.ucHeight * CGFloat(self.vm.arrCellModel.count)
        let screenLeftHeight = kSCREEN_HEIGHT - self.ucTableview.frame.minY - kBOTTOM_HEIGHT
        if allCellsHeight < screenLeftHeight {
            self.ucTableview.isScrollEnabled = false
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.vm.arrCellModel.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ucTableCell.ucHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath) as! ucTableCell
        let cm = self.vm.arrCellModel[indexPath.row]
        cell.imgviewIcon.image = UIImage(named: cm.iconImgName!)
        cell.lbText.text = cm.text
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        //let cell = tableView.cellForRow(at: indexPath)
    }
    
    // tableview 上下边框线
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray
        return view
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray
        return view
    }
    
}
