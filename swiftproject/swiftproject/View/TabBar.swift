//
//  TabBar.swift
//  swiftproject
//
//  Created by 徐孟良 on 2020/4/6.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class TabBar: UITabBar {

    override func layoutSubviews() {
        super.layoutSubviews()
        for button in subviews where button is UIControl {
            var frame = button.frame
            frame.origin.y = -2
            button.frame = frame
        }
        
    }
}
