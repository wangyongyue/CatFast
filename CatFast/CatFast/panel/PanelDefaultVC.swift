//
//  PanelDefaultVC.swift
//  CatFast
//
//  Created by apple on 2019/5/5.
//  Copyright © 2019 wangyongyue. All rights reserved.
//

import UIKit

class PanelDefaultVC: CViewController {

    let navigation = PanelNavigationView()
    let content = PanelContentView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.view.backgroundColor = Color.backGray()
        self.navigationController?.navigationBar.isHidden = true
        
        self.view.addSubview(navigation)
        self.view.addSubview(content)
        
        navigation.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.top.equalTo(0)
            make.height.equalTo(Screen.top())
            
        }
        content.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.top.equalTo(Screen.top())
            make.bottom.equalTo(0)
        }
        
        
        setupNavigation()
        setupAddContent()
        
               
        
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
            
            //保存
            self.model.contentLayout = m
            
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
            
            //保存
            self.model.navigationLayout = m
            tem.remove()
            add.removeFromSuperview()
            
        }
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        

        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("\(model.subId)--\(model.currentId)")

       
        model.navigation = self.navigation.obArray.v_array
        model.content = self.content.obArray.v_array
        
        print("navigation__\(model.navigation)")
        print("content__\(model.content)")
        print("navigation__\(model.navigationLayout)")
        print("content__\(model.contentLayout)")

    }
    
}
