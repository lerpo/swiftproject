//
//  MineViewController.swift
//  swiftproject
//
//  Created by 徐孟良 on 2020/4/6.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class MineViewController: UIViewController {

    @IBOutlet weak var myOrder: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "我的"
        let tap = UITapGestureRecognizer(target:self, action:#selector(goOrderdetail))
        myOrder.addGestureRecognizer(tap)
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    @objc func goOrderdetail()  {
        let ordercontroller:MyOrderViewController = MyOrderViewController(nibName: "MyOrderViewController", bundle: nil)
        self.navigationController?.pushViewController(ordercontroller, animated: true)
    }
}
