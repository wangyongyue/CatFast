

//
//  Root002VC.swift
//  CatFast
//
//  Created by apple on 2019/5/5.
//  Copyright © 2019 wangyongyue. All rights reserved.
//

import UIKit

class Root002VC: CTabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.

        
        let vc1 = PanelDefaultVC()
        vc1.model.currentId = 11000
        let vc2 = PanelDefaultVC()
        vc2.model.currentId = 12000
        
        let vc3 = PanelDefaultVC()
        vc3.model.currentId = 13000
        
        addChildVC(childVC: vc1,title: "df",img: Img.back(),selectedImage: Img.back())
        addChildVC(childVC: vc2,title: "df",img: Img.back(),selectedImage: Img.back())
        addChildVC(childVC: vc3,title: "df",img: Img.back(),selectedImage: Img.back())
        
    }
    
    
    /// 添加子控制器
    private func addChildVC(childVC: UIViewController,title:String,img:UIImage,selectedImage:UIImage) {
        let navigation = CNavigationController.init(rootViewController: childVC)
        
        //背景颜色
        let dict:NSDictionary = [NSAttributedString.Key.foregroundColor: UIColor.white,NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)]
        //标题颜色
        navigation.navigationBar.titleTextAttributes = dict as? [NSAttributedString.Key : AnyObject]
        self.tabBar.tintColor = UIColor.blue
        childVC.title = title
        childVC.tabBarItem.tag = 1
        childVC.tabBarItem.image = img
        childVC.tabBarItem.selectedImage = selectedImage
        self.addChild(navigation)
        
    }
    
    
    
}
