//
//  ZYNetTool.swift
//  ZY-Inke
//
//  Created by apple on 2017/7/7.
//  Copyright © 2017年 ZY. All rights reserved.
//

import UIKit
import Alamofire

class ZYNetTool: NSObject {
    
    static let  netToolManager = ZYNetTool()
    
    func loadLiveData(finished:@escaping(_ liveItmes:Dictionary<String, Any>)->()){
        Alamofire.request(API_NearLocation).responseJSON { (response) in
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")
            if let json = response.result.value {
                print("JSON: \(json)") // serialized json response
            }
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)") // original server data as UTF8 string
            }
        }
    }
    
    
}
