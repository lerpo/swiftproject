//
//  TaoModel.swift
//  swiftproject
//
//  Created by 徐孟良 on 2021/2/14.
//  Copyright © 2021 mac. All rights reserved.
//
import SwiftTools

class TaoModel: BaseModel {
    var allPages:Int = 0
    var currentPage:Int = 1
    var allNum:Int = 0
    var maxResult:Int = 0
    var contentlist:[ModelUser] = []
}

class ModelUser:BaseModel {
    var weight:Int = 0
    var imgList:[String] = []
    var height:Int = 0
    var totalFavorNum:Int = 0
    var link:String = ""
    var userId:String = ""
    var avatarUrl:String = ""
    var realName:String = ""
    var type:String=""
    var totalFanNum:Int = 0
    var cardUrl:String = ""
    var city:String = ""
}
