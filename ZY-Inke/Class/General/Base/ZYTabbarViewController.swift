//
//  ZYTabbarViewController.swift
//  ZY-Inke
//
//  Created by apple on 2017/7/4.
//  Copyright © 2017年 ZY. All rights reserved.
//

import UIKit

class ZYTabbarViewController: UITabBarController,ZYTabbarDelegate{
    
    var itemListGloub       = [UIImage]()
    var selectItemListGloub = [UIImage]()
    
    //构造函数：创建TabbarController
    init(itemList:[UIImage],selectItemList:[UIImage],zyTabbarControllers:[UIViewController]) {
        super.init(nibName: nil, bundle: nil)
        itemListGloub = itemList
        selectItemListGloub = selectItemList
        self.viewControllers = zyTabbarControllers
        
        let tabBar   =  ZYTabbar.init(frame: CGRect.init(x: 0, y: 0, width:SCREEN_WIDTH, height: SCREEN_HEIGHT), itemList: itemListGloub ,selectItemList:selectItemListGloub)
        tabBar.delegate = self;
        self.tabBar.addSubview(tabBar)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func ZYTabbarCallBack(tabbar: ZYTabbar, clickIndex: Int) {
        self.selectedIndex = clickIndex - ZYTabbarItemType.ZYTabbarItemTypeLive.hashValue
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
