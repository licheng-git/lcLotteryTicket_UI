//
//  LotteryHallViewController.swift
//  LotteryTicket
//
//  Created by 李诚 on 17/10/26.
//  Copyright © 2017年 李诚. All rights reserved.
//

import UIKit
import SnapKit

class LotteryHallViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: kSCREEN_WIDTH/3-1, height: 100)
        layout.minimumLineSpacing = 0.5
        layout.minimumInteritemSpacing = 0.5
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = UIColor.white
        //let cellXib = UINib.init(nibName: "lhCollectionCell", bundle: Bundle.main)
        //collectionView.register(cellXib, forCellWithReuseIdentifier: "Cell")
        collectionView.register(lhCollectionCell.classForCoder(), forCellWithReuseIdentifier: "Cell")
        collectionView.register(lhCollectionSectionHeaderView.classForCoder(), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "SectionHeader")
        return collectionView
    } ()
    
    lazy var headerView : UIView = {
        let view = UIView()
        return view
    } ()
    
    lazy var bannerView : BannerView = {
        let view = BannerView()
        return view
    } ()
    
    lazy var runningTipView : RunningTipView = {
        let view = RunningTipView()
        return view
    } ()
    
    lazy var accountView : AccountView = {
        let arr = Bundle.main.loadNibNamed("AccountView", owner: nil, options: nil)
        let view = arr![0] as! AccountView
        return view
    } ()
    
    let arrData = [ ["name":"分分彩", "items": [ ["text":"极速时时彩", "img":"icon_ssc"],
                                                    ["text":"好运11选5", "img":"icon_11x5"],
                                                    ["text":"极速快三", "img":"icon_k3"],
                                                    ["text":"极速飞车", "img":"icon_pk10"],
                                                    ["text":"极速六合彩", "img":"icon_lhc"]
                                            ]
        			],
                    ["name":"官方彩", "items":[ ["text":"天津时时彩", "img":"icon_ssc"],
                                                   ["text":"重庆时时彩", "img":"icon_ssc"],
                                                   ["text":"新疆时时彩", "img":"icon_ssc"],
                                                   ["text":"山东11选5", "img":"icon_11x5"],
                                                   ["text":"江苏11选5", "img":"icon_11x5"],
                                                   ["text":"江西11选5", "img":"icon_11x5"],
                                                   ["text":"广东11选5", "img":"icon_11x5"],
                                                   ["text":"湖北快3", "img":"icon_k3"],
                                                   ["text":"安徽快3", "img":"icon_k3"],
                                                   ["text":"江苏快3", "img":"icon_k3"],
                                                   ["text":"福彩3D", "img":"icon_3d"],
                                                   ["text":"排列5", "img":"icon_pl5"],
                                                   ["text":"北京PK10", "img":"icon_pk10"]
                                            ]
                    ]
    			]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "卡司秀彩票"
        
//        // 滚动headerView
//        self.automaticallyAdjustsScrollViewInsets = false
//        self.view.addSubview(self.collectionView)
//        self.collectionView.frame = CGRect(x: 0, y: kDEFAULT_MARGIN_Y, width: kSCREEN_WIDTH, height: kSCREEN_HEIGHT-kDEFAULT_MARGIN_Y-kBOTTOM_HEIGHT)
//        //self.collectionView.snp.makeConstraints { (make) in
//        //    make.top.equalToSuperview().offset(kDEFAULT_MARGIN_Y)
//        //    make.left.right.equalToSuperview()
//        //    make.bottom.equalToSuperview().offset(-kBOTTOM_HEIGHT)
//        //}
//        
//        let headerView_H : CGFloat = 200.0
//        self.collectionView.contentInset = UIEdgeInsetsMake(headerView_H, 0, 0, 0)
//        self.collectionView.addSubview(self.headerView)
//        self.headerView.frame = CGRect(x: 0, y: -(headerView_H), width: self.collectionView.bounds.size.width, height: headerView_H)
//        //self.headerView.snp.makeConstraints { (make) in
//        //    make.top.equalToSuperview().offset(0-headerView_H)
//        //    make.left.right.equalToSuperview()  // *_* right err
//        //    make.height.equalTo(headerView_H)
//        //}
//        
//        self.headerView.addSubview(self.bannerView)
//        self.bannerView.frame = CGRect(x: 0, y: 0, width: headerView.bounds.size.width, height: headerView.bounds.size.height-50)
//        //self.bannerView.snp.makeConstraints { (make) in
//        //    make.top.left.right.equalToSuperview()
//        //    make.height.equalToSuperview().offset(-80)
//        //}
        
        // 固定headerView
        self.view.addSubview(self.headerView)
        self.headerView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(kDEFAULT_MARGIN_Y)
            make.left.right.equalToSuperview()
            make.height.equalTo(200)
        }
        self.headerView.addSubview(self.bannerView)
        self.bannerView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalToSuperview().offset(-80)
        }
        self.headerView.addSubview(self.runningTipView)
        self.runningTipView.snp.makeConstraints { (make) in
            make.top.equalTo(self.bannerView.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(35)
        }
        self.headerView.addSubview(self.accountView)
        self.accountView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(35)
        }
        self.automaticallyAdjustsScrollViewInsets = false
        self.view.addSubview(self.collectionView)
        self.collectionView.snp.makeConstraints { (make) in
            make.top.equalTo(self.headerView.snp.bottom)
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(-kBOTTOM_HEIGHT)
        }
        
        self.accountView.lbAccount.text = "licheng"
        self.accountView.lbAmount.text = "100.00"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if !self.runningTipView.bIsRunning {
            self.runningTipView.lbText.text = "卡司秀[CS]官方彩票系统正式与PK平台携手运营 哈哈嘿嘿吼吼卡卡"
            if !(self.runningTipView.lbText.text?.isEmpty)! {
                self.runningTipView.lbText.sizeToFit()
                self.runningTipView.keepRunning()
                self.runningTipView.bIsRunning = true
            }
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.arrData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let arrItems = self.arrData[section]["items"] as! [Any]
        return arrItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellIdentifier = "Cell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! lhCollectionCell
        let arrItems = self.arrData[indexPath.section]["items"] as! [Any]
        let dictItem = arrItems[indexPath.row] as! [String:String]
        cell.lbName.text = dictItem["text"]
        cell.imgviewIcon.image = UIImage(named: dictItem["img"]!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //let cell = collectionView.cellForItem(at: indexPath)
        let vc = BuyingDetailViewController()
        self.tabBarController?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.size.width, height: 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerIdentifier = "SectionHeader"
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerIdentifier, for: indexPath) as! lhCollectionSectionHeaderView
        header.lbName.text = self.arrData[indexPath.section]["name"] as? String
        return header
    }
    
}
