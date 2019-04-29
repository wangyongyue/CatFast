//
//  PanelVC.swift
//  CatFast
//
//  Created by apple on 2019/4/24.
//  Copyright © 2019 wangyongyue. All rights reserved.
//

import UIKit

class PanelVC: CViewController {

    
 
    let navigation = PanelNavigationView()
    let content = PanelContentView()
    let tabBar = PanelTabBarView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.view.backgroundColor = Color.backGray()
        self.navigationController?.navigationBar.isHidden = true
        
        self.view.addSubview(navigation)
        self.view.addSubview(content)
        self.view.addSubview(tabBar)

        navigation.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.top.equalTo(0)
            make.height.equalTo(Screen.top())

        }
        content.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.top.equalTo(Screen.top())
            make.bottom.equalTo(Screen.bottom())
        }
        tabBar.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.bottom.equalTo(0)
            make.height.equalTo(Screen.bottomH())
        }
        
        setupNavigation()
        setupAddContent()
        setupTabBar()

    }
   
    
    func setupAddContent(){

        let style = Style().backgroundColor(Color.clear()).textColor(Color.gray()).textAlignment( .center).text("添加")
        let add = CButton(style)
        self.view.addSubview(add)
        add.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.centerY.equalToSuperview()
        }
        let tem =  TemplatesView()
        add.v_click {
        
            CWindow.init(true).addSubview(tem)
        }
        
        tem.obIndex.v_index { (index) in
            let m = tem.obArray.v_array?[index]
            self.content.loadData(m)

            tem.remove()
            add.removeFromSuperview()
            
        }
        
        
    }
    
    func setupNavigation(){
        
        let style = Style().backgroundColor(Color.clear()).textColor(Color.gray()).textAlignment( .center).text("添加")
        let add = CButton(style)
        self.view.addSubview(add)
        add.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.top.equalTo(0)
            make.height.equalTo(Screen.top())

        }
        let tem =  NavigationsView()
        add.v_click {
            
            CWindow.init(true).addSubview(tem)
        }
        
        tem.obIndex.v_index { (index) in
            
            let m = tem.obArray.v_array?[index]
            self.navigation.loadData(m)
            tem.remove()
            add.removeFromSuperview()
            
        }
        
        
    }
    
    func setupTabBar(){
        
        let style = Style().backgroundColor(Color.clear()).textColor(Color.gray()).textAlignment( .center).text("添加")
        let add = CButton(style)
        self.view.addSubview(add)
        add.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.bottom.equalTo(0)
            make.height.equalTo(Screen.bottomH())

        }
        let tem =  TemplatesView()
        add.v_click {
            
            CWindow.init(true).addSubview(tem)
        }
        
        tem.obIndex.v_index { (index) in
            

            let m = tem.obArray.v_array?[index]
            self.tabBar.loadData(m)
            tem.remove()
            add.removeFromSuperview()
            
        }
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
}


//{
//    "data": [{
//    "contentLayout": "Tem001Layout",
//    "title": "title",
//    "navigationLayout": "title",
//    "tabBarLayout": "title",
//    "topMenu": "title",
//    "bottomMenu": "title",
//    "array": [{
//    "model": "Com001CellModel",
//    "data": {
//    "name": "wyy",
//    "age": "wyy",
//    "sex": "wyy"
//    }
//    }]
//    }]
//}
