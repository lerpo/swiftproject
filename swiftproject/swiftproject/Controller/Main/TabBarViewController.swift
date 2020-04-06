//
//  TabBarViewController.swift
//  swiftproject
//
//  Created by 徐孟良 on 2020/4/6.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setValue(TabBar(), forKey: "tabBar")
        tabBar.tintColor = UIColor.orange
        addChildConroller("首页","news","news", HomeViewController.self)
        addChildConroller("发现","find","find", FindViewController.self)
        addChildConroller("我的","mine","mine", MineViewController.self)
    }
    

    func addChildConroller(_ title:String,
        _ image:String,
        _ selectImage:String,
        _ type:UIViewController.Type)->(){
        let child = UINavigationController(rootViewController: type.init())
        child.title = title
        child.tabBarItem.image = UIImage(named: image)
        child.tabBarItem.selectedImage = UIImage(named: selectImage)
        child.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor:UIColor.orange], for: .selected)
        
        addChild(child)
    }
   

}
