//
//  PanelVC.swift
//  CatFast
//
//  Created by apple on 2019/4/24.
//  Copyright © 2019 wangyongyue. All rights reserved.
//

import UIKit

class PanelVC: CViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let style = Style().text("添加").backgroundColor(Color.clear()).textColor(Color.red()).x(100).y(200).width(60).height(30)
        let button = CButton(style)
        self.view.addSubview(button)
        button.v_click {
        
                        
            let window = CWindow()
            window.disappear = true
            
            
//            let t =  TemplatesView()
//            window.addSubview(t)
//            t.frame = CGRect.init(x: 0, y: Screen.height() - 200, width: Screen.width(),height: 200)
//            
            
            let t =  ComponentsView()
            window.addSubview(t)
            t.frame = CGRect.init(x: 0, y: Screen.height() - 200, width: Screen.width(),height: 200)
            
            
        }
        
        
    }
}

