//
//  Panel003VC.swift
//  CatFast
//
//  Created by apple on 2019/4/28.
//  Copyright © 2019 wangyongyue. All rights reserved.
//

import UIKit

class Panel003VC: CViewController {

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
            make.bottom.equalTo(Screen.bottom())
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
            
            self.content.loadData()
            
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
            
            self.navigation.loadData()
            
            tem.remove()
            add.removeFromSuperview()
            
        }
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
}
