//
//  CViewController.swift
//  CatFlow
//
//  Created by apple on 2019/3/14.
//  Copyright © 2019 wyy. All rights reserved.
//

import UIKit
typealias popCallBack = (_ obj:AnyObject?) -> ()
class CViewController: UIViewController {
    var params:[String:Any]?
    
    var call:popCallBack?
    var model = PanelModel()
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
    }
    
    


}
