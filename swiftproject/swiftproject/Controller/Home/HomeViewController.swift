//
//  HomeViewController.swift
//  swiftproject
//
//  Created by 徐孟良 on 2020/4/6.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    lazy var tableView = UITableView()
    var dataList:[NewsModel]?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.orange
        title = "首页"
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(NewsCellTableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        tableView.separatorStyle = .none
        view.addSubview(tableView)
        loadData()
    }
    

    func loadData() {
        let url = "http://api.avatardata.cn/Joke/QueryJokeByTime?key=bd15315552784d3a9716f425e2f533c4&page=1&rows=50&sort=asc&time=1418745237"
        RequestUtil.get(url: url,success: { (data) -> (Void) in
           
            self.dataList = (JsonUtil.jsonArrayToModel(data["result"].rawString()!,NewsModel.self) as! [NewsModel])
            self.tableView.reloadData()
          
        }) { (data) -> (Void) in
                   
        }
    }
}

extension HomeViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return dataList?.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
        UITableViewCell {
            
        let mode:NewsModel = dataList![indexPath.row]
            
        var cell:NewsCellTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! NewsCellTableViewCell
        if cell == nil  {
            cell = NewsCellTableViewCell(style: .default, reuseIdentifier: "cell")
        }
        
        cell.imgView?.image = UIImage(named: "AppIcon")
        cell.contentLable?.text = mode.content
        cell.timeLable?.text = mode.updatetime
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
        
    }
    
    
}
