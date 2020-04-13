//
//  FindViewController.swift
//  swiftproject
//
//  Created by 徐孟良 on 2020/4/6.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class FindViewController: UIViewController {

    var dataList:[PicModel]?
    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        title = "发现"
        tableview.dataSource = self
        tableview.delegate = self
        tableview.separatorStyle = .none
        loadData()
    }


    func loadData() {
        let url = "https://route.showapi.com/852-2?showapi_appid=169505&showapi_sign=88732d60b8454ceb8357503618564834&type=4001&page=1"
        NoticeUtil.instance.showNotice(context:self, message: "加载中...")
        RequestUtil.get(url: url,success: { (data) -> (Void) in
           
            self.dataList = (JsonUtil.jsonArrayToModel(data["showapi_res_body"]["pagebean"]["contentlist"].rawString()!,PicModel.self) as! [PicModel])
            self.tableview.reloadData()
            NoticeUtil.instance.hideNotice()
        }) { (data) -> (Void) in
            NoticeUtil.instance.hideNotice()
        }
    }
}

extension FindViewController:UITableViewDataSource,UITableViewDelegate {
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let picModel:PicModel = dataList![section]
        let picList = picModel.list
        
        return picList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:FindCell = Bundle.main.loadNibNamed("FindCell", owner: nil, options: nil)?.first as! FindCell
        let pic:Picture = self.dataList![indexPath.section].list[indexPath.row]
        let urlwithPercentEscapes = pic.middle.addingPercentEncoding( withAllowedCharacters: .urlQueryAllowed)
        let imgu:URL = URL.init(string: urlwithPercentEscapes!)!
        cell.imageV.kf.setImage(with:imgu)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 500
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 44
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let titleLable:UILabel = UILabel()
        titleLable.snp.makeConstraints { (make) in
            make.height.equalTo(44)
            make.width.equalTo(300)
        }
        
        let model:PicModel = self.dataList![section]
        titleLable.text = model.title
        
        return titleLable
    }
    
    
    
    
    
}
