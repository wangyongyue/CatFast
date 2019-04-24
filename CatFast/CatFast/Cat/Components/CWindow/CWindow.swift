//
//  CWindow.swift
//  CatFlow
//
//  Created by apple on 2019/3/14.
//  Copyright © 2019 wyy. All rights reserved.
//

import UIKit

class CWindow: UIView {

    var disappear = false
    static func addSubview(_ view: UIView,isDisappear:Bool) {
        
        let window = UIApplication.shared.keyWindow
        if let w = window{
            
            let sub = CWindow()
            sub.backgroundColor = UIColor.darkGray
            sub.alpha = 0.6
            sub.frame = w.bounds
            w.addSubview(sub)
            
            sub.addSubview(view)
            sub.disappear = isDisappear
        }
        
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if self.disappear{
            self.removeFromSuperview()

        }
    }

}
class Screen{
    
    static func width() -> CGFloat{
        
        return UIScreen.main.bounds.width
    }
    static func height() -> CGFloat{
        
        return UIScreen.main.bounds.height
    }
}
extension UIView{
    
    func width() -> CGFloat{
        
        return self.bounds.width
    }
    func height() -> CGFloat{
        
        return self.bounds.height
    }
}
