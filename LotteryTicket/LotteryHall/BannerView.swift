//
//  BannerView.swift
//  LotteryTicket
//
//  Created by Cheng Li on 2017/10/31.
//  Copyright © 2017年 李诚. All rights reserved.
//

import UIKit
import SnapKit

class BannerView : UIView {
    
    lazy var imgview : UIImageView = {
        let imgview = UIImageView()
        imgview.image = UIImage(named: "banner")
        return imgview
    } ()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(self.imgview)
        self.imgview.snp.makeConstraints { (make) in
            make.top.bottom.left.right.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
