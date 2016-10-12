//
//  TextField+Util.swift
//  CodeShareDemo
//
//  Created by 千锋 on 16/10/11.
//  Copyright © 2016年 LRC. All rights reserved.
//

import UIKit

extension UITextField {
    
    class func createTextField(placeholder: String,textSize: CGFloat,secureTextEntry: Bool) -> UITextField {
        
        let textField = UITextField()
        textField.secureTextEntry = secureTextEntry
        textField.placeholder = placeholder
        textField.font = UIFont.systemFontOfSize(textSize)
        textField.backgroundColor = UIColor.whiteColor()
        textField.layer.borderColor = UIColor.grayColor().CGColor
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 5.0
//        if let left = leftView {
//            textField.leftView = left
//        }
//        if let right = rightView {
//            textField.rightView = right
//        }
        
        return textField
    }
    
    
}