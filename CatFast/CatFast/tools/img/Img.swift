//
//  Img.swift
//  CatFast
//
//  Created by apple on 2019/4/24.
//  Copyright © 2019 wangyongyue. All rights reserved.
//

import UIKit

class Img: NSObject {
    
    static func back() -> UIImage{
        
        let img = UIImage.init(named: "na_back")
        if let i = img{
            return i
        }
        return UIImage()
    }

}
