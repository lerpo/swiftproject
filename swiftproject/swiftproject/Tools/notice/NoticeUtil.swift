//
//  NoticeUtil.swift
//  swiftproject
//
//  Created by 徐孟良 on 2020/4/13.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class NoticeUtil: NSObject {
    
   static var  instance:NoticeUtil = NoticeUtil()
    
    func showNotice(context:UIViewController, message:String) {
//        MBProgressHUD.init(view: view).show(animated: true)
        let HUD = MBProgressHUD.showAdded(to: context.view, animated: true)
//        HUD.delegate = context as! MBProgressHUDDelegate
           
           //常用设置
           //小矩形的背景色
        HUD.bezelView.color = UIColor.black
           //显示的文字
        HUD.label.text = message
        HUD.label.textColor = .white
        HUD.customView?.backgroundColor = .white
           //细节文字
//        HUD.detailsLabel.text = "请耐心等待..."
//        HUD.detailsLabel.textColor = .white
           //设置背景,加遮罩
        HUD.backgroundView.style = .blur //或SolidColor
        HUD.hide(animated: true, afterDelay: 2)
    }
    func hideNotice() {
        MBProgressHUD.init().hide(animated: true)
    }
}
