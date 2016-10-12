//
//  CSTabBarViewController.swift
//  CodeShareDemo
//
//  Created by 千锋 on 16/10/11.
//  Copyright © 2016年 LRC. All rights reserved.
//

import UIKit

class CSTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        configerViewControllers()
        
    }
    
    func configerViewControllers() {
        let vcInfos = [
            [
                "title": "主页",
                "image": "tabbar_1",
                "class": "UIViewController"
            ],
            [
                "title": "消息",
                "image": "tabbar_1",
                "class": "UIViewController"
            ],
            [
                "title": "分享",
                "image": "tabbar_1",
                "class": "UIViewController"
            ],
            [
                "title": "我的",
                "image": "tabbar_1",
                "class": "UIViewController"
            ]
 
        ]
        
        var vcArray: [UINavigationController] = []
        for vcInfo in vcInfos {
            let vc = (NSClassFromString(vcInfo["class"]!) as! UIViewController.Type).init()
            vc.view.backgroundColor = UIColor.whiteColor()
            vc.title = vcInfo["title"]
            let navVC = UINavigationController(rootViewController: vc)
            vcArray.append(navVC)
        }
        
        self.viewControllers = vcArray
    }

    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        let loginVC = UINavigationController(rootViewController: CSLoginViewController())
        self.presentViewController(loginVC, animated: true, completion: nil)    
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
