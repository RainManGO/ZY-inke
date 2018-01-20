//
//  ZYTabbar.swift
//  ZY-Inke
//
//  Created by apple on 2017/7/4.
//  Copyright © 2017年 ZY. All rights reserved.
//

import UIKit

typealias btnClickCallback = ()->()

protocol ZYTabbarDelegate {
    func ZYTabbarCallBack(tabbar:ZYTabbar,clickIndex:Int);
}

enum ZYTabbarItemType:Int {
    case ZYTabbarItemTypeLauch = 10
    case ZYTabbarItemTypeLive = 200,ZYTabbarItemTypeMy
}

class ZYTabbar: UIView {
    var btnCallback:btnClickCallback?
    var delegate:ZYTabbarDelegate?
    var itemArrayList:[UIImage] = [UIImage]()
    var selectItemListGloub:[UIImage] = [UIImage]()
    var lastItem:UIButton?
    var camera:UIButton?
    /// 懒加载背景图
    lazy var backgroundImage:UIImageView = {
        let backgroundImage = UIImageView.init()
        return backgroundImage
    }()
    //构造函数
    init(frame: CGRect,itemList:[UIImage],selectItemList:[UIImage]) {
        super.init(frame: frame)
        itemArrayList = itemList
        selectItemListGloub = selectItemList
        creatUI();
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let  width = Int(SCREEN_WIDTH)/itemArrayList.count
        for btn in self.subviews {
            if btn.tag>=ZYTabbarItemType.ZYTabbarItemTypeLive.hashValue {
                btn.frame = CGRect.init(x: width * (btn.tag - ZYTabbarItemType.ZYTabbarItemTypeLive.hashValue), y: 0, width: width, height: 49)
            }
        }
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //load UI
    func creatUI(){
        self.loadBackgroudImage()
        self.loadTabItem()
    }
    
    //装载背景图
    func loadBackgroudImage(){
        self.backgroundImage.image = UIImage.init(named:"global_tab_bg")
    }
    
    //装载item
    func loadTabItem(){
        for (index,itemImage) in itemArrayList.enumerated() {
            let  itemBtn = UIButton.init(type: .custom)
            itemBtn.adjustsImageWhenHighlighted = false
            itemBtn.addTarget(self, action:#selector(self.changeBtn(sender:)), for: .touchUpInside)
            itemBtn.setImage(itemImage, for: .normal)
            itemBtn.setImage(selectItemListGloub[index], for: .selected)
            itemBtn.tag = ZYTabbarItemType .ZYTabbarItemTypeLive .hashValue + index
            if index==0 {
                itemBtn.isSelected = true
                lastItem = itemBtn
            }
            self.addSubview(itemBtn)
        }
        
        let camera = UIButton.init(type:.custom)
        camera.frame = CGRect.init(x:Int(SCREEN_WIDTH)/itemArrayList.count-30, y:-20, width: 60, height:60)
        camera.setImage(#imageLiteral(resourceName: "tab_launch"), for: .normal)
        camera.tag = ZYTabbarItemType.ZYTabbarItemTypeLauch.hashValue
        camera.addTarget(self, action: #selector(changeBtn(sender:)), for: .touchUpInside)
        self.addSubview(camera);
    }
    
    //装载按钮图片
    func loadCameraBtn(){
        
    }
    //切换按钮
    @objc func changeBtn(sender:UIButton){
        
        if (delegate != nil) {
            delegate?.ZYTabbarCallBack(tabbar: self, clickIndex: sender.tag)
        }
        
        if (sender.tag>=ZYTabbarItemType.ZYTabbarItemTypeLive.hashValue){
            lastItem?.isSelected = false
            sender.isSelected = true
            lastItem = sender
            
            UIView.animate(withDuration: 0.4, animations: {
                sender.transform = CGAffineTransform.init(scaleX: 1.2, y: 1.2)
            }) { (true) in
                sender.transform = CGAffineTransform.identity
            }
        }
        
    }
    
}
