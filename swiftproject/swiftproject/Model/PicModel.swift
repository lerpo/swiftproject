//
//  PicModel.swift
//  swiftproject
//
//  Created by 徐孟良 on 2020/4/12.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class PicModel: BaseModel {
    var ct:String = ""
    var itemId:String = ""
    var list:[Picture] = []
    var title:String = ""
}

class Picture: BaseModel {
    var big:String = ""
    var middle:String = ""
    var small:String = ""
}
