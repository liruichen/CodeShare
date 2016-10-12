//
//  CSUtil.swift
//  CodeShareDemo
//
//  Created by 千锋 on 16/10/11.
//  Copyright © 2016年 LRC. All rights reserved.
//

import UIKit

class CSUtil: NSObject {

    //显示提示信息
    class func showAlert(
        onViewController vCtrl: UIViewController,msg: AnyObject,onfirmClosure: (Void->Void)? ) {
        //1.创建视图控制器
        let alertCtrl = UIAlertController(title: "温馨提示", message: msg as? String, preferredStyle: .Alert)
        
        //2.添加按钮
        let action = UIAlertAction(title: "确定", style: .Default) {
            (action) in
            if let myClosure = onfirmClosure {
                myClosure()
            }
        }
        
        alertCtrl.addAction(action)
        //3.显示视图控制器
        dispatch_async(dispatch_get_main_queue()) {
            vCtrl.presentViewController(alertCtrl, animated: true, completion: nil)
        }
        
        
    }
    
}
