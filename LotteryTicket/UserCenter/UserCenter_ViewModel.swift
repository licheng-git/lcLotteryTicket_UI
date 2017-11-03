//
//  UserCenter_ViewModel.swift
//  LotteryTicket
//
//  Created by Cheng Li on 2017/11/3.
//  Copyright © 2017年 李诚. All rights reserved.
//

import Foundation

class UserCenter_ViewModel {
    
    //var arrCellModel: Array<UserCenter_Cell_Model>?
    var arrCellModel = [UserCenter_Cell_Model]()
    
    private let arrCellData = [ ["img":"userHeader", "text":"公告信息"],
                                ["img":"userHeader", "text":"投注记录"],
                                ["img":"userHeader", "text":"交易记录"] ]
    
    func getCellData() {
        self.arrCellModel.removeAll()
        for dictItem in arrCellData {
            let cm = UserCenter_Cell_Model()
            cm.iconImgName = dictItem["img"]
            cm.text = dictItem["text"]
            self.arrCellModel.append(cm)
        }
    }
    
    
    var model: UserCenter_Model?
    
    func getHeaderData(_ cComplete:((_ model:UserCenter_Model)->())?) {
        self.model = UserCenter_Model()
        self.model?.headerImgName = "userHeader"
        self.model?.account = "licheng"
        self.model?.amount = "2000.00"
        self.model?.todayProfit = "0.00"
        if cComplete != nil {
            cComplete!(self.model!)
        }
    }
    
}