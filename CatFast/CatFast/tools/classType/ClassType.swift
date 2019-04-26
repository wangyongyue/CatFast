//
//  ClassType.swift
//  CatFast
//
//  Created by apple on 2019/4/26.
//  Copyright © 2019 wangyongyue. All rights reserved.
//

import UIKit

class ClassType: NSObject {

    static func getCatClass(_ prefix:String?,_ rank:Int) -> Cat?{
    
        var a = "1"
        if rank < 10{
            a = "00\(rank)"
            
        }else if rank >= 10 && rank < 100{
            a = "0\(rank)"
            
        }else if rank >= 100{
            
            a = "\(rank)"
        }
        if let pre = prefix{
            
            let className = appName +  "\(pre)\(a)CellModel"
            if let classType = NSClassFromString(className) as? Cat.Type {
                
                let m = classType.init("\(pre)\(a)Cell")
                return m
            }
        }
       
        return Cat.init()
        
    }
    
    static func getCellClass(_ prefix:String?,_ rank:Int) -> AnyClass?{
        
        var a = "1"
        if rank < 10{
            a = "00\(rank)"
            
        }else if rank >= 10 && rank < 100{
            a = "0\(rank)"
            
        }else if rank >= 100{
            
            a = "\(rank)"
        }
        if let pre = prefix{
            
            let className = appName +  "\(pre)\(a)Cell"
            let classType = NSClassFromString(className)
            return classType
        }
        
        return CollectionTemplate.classForCoder()
        
    }
}
