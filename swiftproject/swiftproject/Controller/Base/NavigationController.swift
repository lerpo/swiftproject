//
//  EMDNavigationController.swift
//  swiftproject
//
//  Created by 徐孟良 on 2020/5/16.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit
import SwiftTools

enum NavigationBarStyle {
    case black
    case white
}

class NavigationController: UINavigationController {
    
    
    var btn:UIButton?
    
    var navigationStyle:NavigationBarStyle = .black{
        didSet{
            (navigationStyle == .black) ? setNavigationBarBlackStyle() : setNavigationBarWhiteStyle()
            (navigationStyle == .black) ? btn?.setImage(UIImage.init(named: "back"), for: .normal) : btn?.setImage(UIImage.init(named: "white_back"), for: .normal)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationBar.barStyle = .default
        // 隐藏 导航控制器 底部的线
        navigationBar.setBackgroundImage(UIImage.init(), for: .default)
        navigationBar.shadowImage = UIImage.init()
        
        
        (navigationStyle == .black) ? setNavigationBarBlackStyle() : setNavigationBarWhiteStyle()
    }
    
    fileprivate func setNavigationBarWhiteStyle()
    {
        navigationBar.barTintColor = ColorConstant.MAIN_THEME
        navigationBar.titleTextAttributes = [NSAttributedString.Key.font:UIFont.init(name: "PingFangSC-Regular", size: 17)!,
                                             NSAttributedString.Key.foregroundColor:UIColor.white]
        
        
    }
    
    fileprivate func setNavigationBarBlackStyle()
    {
        navigationBar.barTintColor = UIColor.white
        navigationBar.titleTextAttributes = [NSAttributedString.Key.font:UIFont.init(name: "PingFangSC-Regular", size: 17)!,
                                             NSAttributedString.Key.foregroundColor:UIColor.black]
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        if children.count > 0 {
            
            let btn = UIButton(type: .custom)
            btn.setImage(UIImage.init(named: "back"), for: .normal)
            btn.sizeThatFits(CGSize(width: 70, height: 30))
            btn.contentHorizontalAlignment = .left
            btn.addTarget(self, action: #selector(popViewController), for: .touchUpInside)
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: btn)
            self.btn = btn
            
            // 隐藏底部tabbar
            viewController.hidesBottomBarWhenPushed = true
        }
        
        super.pushViewController(viewController, animated: true)
    }

}
