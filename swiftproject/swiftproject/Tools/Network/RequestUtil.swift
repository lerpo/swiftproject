//
//  RequestUtil.swift
//  swiftproject
//
//  Created by 徐孟良 on 2020/4/11.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit
import SwiftyJSON

typealias successCallback =  (_ data:JSON)->(Void)
typealias faildCallback =  (_ response:AFError)->(Void)

var apiKey = "ad86db1c165d4d86ae4c62b44a8f7324"
class RequestUtil: NSObject {
    
    
    static var headers:HTTPHeaders = ["Content-Type": "application/json"]
    
    static func get(url:String,success:@escaping successCallback, fail:@escaping faildCallback)  {
          
        AF.request(url, method: HTTPMethod.get, headers: headers).responseJSON { response in
           
            switch response.result {
            case .success(let data):
                success(JSON(data))
            case .failure(let error):
                fail(error)
            }
        }
    }
    
    static func post(url:String, parameters:Parameters, success:@escaping successCallback, fail:@escaping faildCallback){
       AF.request(url, method: HTTPMethod.post, parameters: parameters,  headers: headers).responseJSON { response in
       
           switch response.result {
            case .success(let data):
                  success(JSON(data))
            case .failure(let error):
                  fail(error)
            }
       }
    }
//
//    static func put(<#parameters#>) -> <#return type#> {
//
//    }
//
//    static func delete(<#parameters#>) -> <#return type#> {
//
//    }
    
    
}
