//
//  MyOrderViewController.swift
//  swiftproject
//
//  Created by 徐孟良 on 2020/4/19.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit


class MyOrderViewController: UIViewController {
    
    @IBOutlet weak var myLayer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "我的"
        let layer:CALayer = CALayer()
        layer.frame = self.myLayer.frame
//        layer.backgroundColor = UIColor.orange.cgColor
        layer.contents = UIImage.init(named: "frend_bg")?.cgImage
        self.myLayer.layer.addSublayer(layer)
        
    }


    

}
