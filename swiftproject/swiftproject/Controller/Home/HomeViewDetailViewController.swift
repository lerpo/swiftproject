//
//  HomeViewDetailViewController.swift
//  swiftproject
//
//  Created by 徐孟良 on 2020/5/16.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class HomeViewDetailViewController: UIViewController {
    var model:NewsModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        let lable:UILabel = UILabel()
        view.addSubview(lable)
        lable.lineBreakMode = .byCharWrapping;
        lable.numberOfLines = 0;
        lable.textAlignment = .justified
        lable.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(0)
            make.left.equalToSuperview().offset(0)
            make.bottom.equalToSuperview().offset(0)
            make.right.equalToSuperview().offset(0)
        }
        if(model != nil) {
            lable.text = model?.content
        }
    }

}
