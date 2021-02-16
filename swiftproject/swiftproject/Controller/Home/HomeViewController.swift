//
//  HomeViewController.swift
//  swiftproject
//
//  Created by 徐孟良 on 2020/4/6.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit
import SwiftyJSON

class HomeViewController: UIViewController {

    var tableView = UITableView()
    var dataList:[ModelUser] = []
    var dataModel:TaoModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        title = "首页"
        tableView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height-44)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(NewsCellTableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        tableView.separatorStyle = .none
        view.addSubview(tableView)
        tableView.setRefreshHeader(target: self, action: #selector(refreshData))
        tableView.setRefreshFooter(target: self, action: #selector(moreData))
        tableView.startRefresh()
    }
    
    var page:Int = 1
    
   @objc func refreshData(){
     self.dataList.removeAll()
     page = 1
     var param:Parameters = [:]
     param["type"] = "甜美"
     param["page"] = page
     loadData(param: &param)
    }
    
   @objc func moreData(){
        var param:Parameters = [:]
        page += 1
        if page > self.dataModel!.allPages {
             return
        }
        param["type"] = "甜美"
        param["page"] = page
        loadData(param: &param)
        
    }
    
   func loadData(param:inout Parameters) {
        let url = "https://route.showapi.com/126-2"
        NoticeUtil.instance.showNotice(context:self, message: "加载中...")
        param["showapi_appid"] = "169507"
        param["order"] = "1"
        param["showapi_sign"] = "ad86db1c165d4d86ae4c62b44a8f7324"
        RequestUtil.get(url: url,queryParam: param, success: { (data) -> (Void) in
            let body = data["showapi_res_body"]
            let pageBean = body["pagebean"]
            self.dataModel = (JsonUtil.jsonToModel(pageBean.rawString()!,TaoModel.self) as! TaoModel)
            self.dataList += self.dataModel!.contentlist
            self.tableView.reloadData()
            if self.dataModel!.contentlist.count <= 0 {
                self.tableView.noMareData()
            } else {
                self.tableView.endRefresh()
            }
            
            NoticeUtil.instance.hideNotice()
        }) { (data) -> (Void) in
            NoticeUtil.instance.hideNotice()
            self.tableView.endRefresh()
        }
    }
}

extension HomeViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return dataList.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
        UITableViewCell {
            
        let mode:ModelUser = dataList[indexPath.row]
            
        let cell:NewsCellTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NewsCellTableViewCell
//        if cell == nil  {
//            cell = NewsCellTableViewCell(style: .default, reuseIdentifier: "cell")
//        }
        let imageUrl = mode.imgList.count > 0 ? mode.imgList[0] : mode.avatarUrl
        cell.userImg?.kf.setImage(with: URL.init(string: imageUrl),placeholder:  UIImage(named: "joke_icon"))
        cell.userHeadImg?.kf.setImage(with: URL.init(string: mode.avatarUrl),placeholder:  UIImage(named: "joke_icon"))
        cell.userNameLable?.text = mode.realName
        cell.timeLable?.text = "体重:\(mode.weight)  身高:\(mode.height)  城市:\(mode.city)"
        cell.selectionStyle = .none
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailController:HomeViewDetailViewController = HomeViewDetailViewController();
//        detailController.model = dataList![indexPath.row]
        self.navigationController?.pushViewController(detailController, animated: true)
    }
    
    
}
