//
//  CNavigationController.swift
//  CatFast
//
//  Created by apple on 2019/4/24.
//  Copyright © 2019 wangyongyue. All rights reserved.
//

import UIKit

class CNavigationController: UINavigationController ,UINavigationControllerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.delegate = self
        
        //样式
        
        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white,NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18)]
        
        
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        
        
        
    }
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        
        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.shadowImage  = UIImage()
        
        setBackButton(viewController: viewController)
    }
    
    func setBackButton(viewController: UIViewController) {
        
        let array:[AnyClass] = [NewVC.classForCoder()]
        var isBack = true
        for value in array {
            
            if viewController.classForCoder == value{
                
                isBack = false
                break
            }
        }
        
        if isBack {
            
            let style  = Style().backgroundColor(UIColor.clear).text("返回").textColor(Color.black())
            let back = CButton(style)
            back.v_click {
                
                Router.pop(nil)
            }
           
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView:back)
        }
        
        
        
    }
    
    
}


