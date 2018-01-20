//
//  ZYLiveViewController.swift
//  ZY-Inke
//
//  Created by apple on 2017/7/5.
//  Copyright © 2017年 ZY. All rights reserved.
//

import UIKit

class ZYLiveViewController: ZYBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.red
        // Do any additional setup after loading the view.
        var data = Dictionary<String, Any>.init()
        
        ZYNetTool().loadLiveData { (data) in
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
