//
//  Button+Util.swift
//  CodeShareDemo
//
//  Created by 千锋 on 16/10/11.
//  Copyright © 2016年 LRC. All rights reserved.
//

import UIKit

extension UIButton {
    
    class func createBtn(frame: CGRect?,title: String?
        ,image: UIImage?,target: AnyObject?,action: Selector?) -> UIButton {
        
        let btn = UIButton(type: .Custom)
        if let tmpFrame = frame {
            btn.frame = tmpFrame
        }
        if let tmpTitle = title {
            btn.setTitle(tmpTitle, forState: .Normal)
        }
        if let tmpImage = image {
            btn.setImage(tmpImage, forState: .Normal)
        }
        
        if target != nil && action != nil {
            btn.addTarget(target, action: action!, forControlEvents: .TouchUpInside)
        }
        return btn
        
    }
    
    
}
