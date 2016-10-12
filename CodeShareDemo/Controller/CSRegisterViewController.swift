//
//  CSRegisterViewController.swift
//  CodeShareDemo
//
//  Created by 千锋 on 16/10/11.
//  Copyright © 2016年 LRC. All rights reserved.
//

import UIKit
import SnapKit
import JKCategories
import Alamofire

class CSRegisterViewController: UIViewController {

    var userName: UITextField?
    var password: UITextField?
    var verifyText: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "注册"
        view.backgroundColor = UIColor.whiteColor()
        
        createUserName()
        createPassword()
        createverifyText()
        createRegisBtn()
        
        
    }

    //创建用户名框
    func createUserName() {
        userName = UITextField.createTextField("请输入邮箱或手机号码", textSize: 15,secureTextEntry: false)
        self.view.addSubview(userName!)
        userName!.snp_makeConstraints { (make) in
            make.top.equalTo(130)
            make.right.left.equalTo(0)
            make.height.equalTo(50)
        }
        let nameLeft = UIView()
        let nameImage = UIImageView(image: UIImage(named: "用户图标"))
        userName?.leftView = nameLeft
        userName?.leftViewMode = .Always
        nameLeft.addSubview(nameImage)
        
        nameLeft.snp_makeConstraints { (make) in
            make.size.equalTo(CGSizeMake(50, 50))
        }
        nameImage.snp_makeConstraints { (make) in
            make.center.equalTo(0)
        }
        
    }
    
    //创建密码框
    func createPassword() {
        
        password = UITextField.createTextField("请输入密码", textSize: 15, secureTextEntry: true)
        self.view.addSubview(password!)
        password!.snp_makeConstraints { (make) in
            make.top.equalTo(userName!.snp_bottom)
            make.right.left.equalTo(0)
            make.height.equalTo(50)
        }
        
        let passLeft = UIView()
        let passImage = UIImageView(image: UIImage(named: "密码图标"))
        password?.leftView = passLeft
        password?.leftViewMode = .Always
        passLeft.addSubview(passImage)
        
        passLeft.snp_makeConstraints { (make) in
            make.size.equalTo(CGSizeMake(50, 50))
        }
        passImage.snp_makeConstraints { (make) in
            make.center.equalTo(0)
        }
    }
    
    //创建验证码框
    func createverifyText() {
        verifyText = UITextField.createTextField("请输入验证码", textSize: 15,secureTextEntry: false)
        self.view.addSubview(verifyText!)
        verifyText!.snp_makeConstraints { (make) in
            make.top.equalTo((password?.snp_bottom)!)
            make.right.left.equalTo(0)
            make.height.equalTo(50)
        }
        
        let verifyLeft = UIView()
        let verifyRight = UIView()
        
        let verifyLeftImage = UIImageView(image: UIImage(named: "验证信息图标"))
        verifyText?.leftView = verifyLeft
        verifyText?.leftViewMode = .Always
        verifyLeft.addSubview(verifyLeftImage)
        
        verifyLeft.snp_makeConstraints { (make) in
            make.size.equalTo(CGSizeMake(50, 50))
        }
        verifyLeftImage.snp_makeConstraints { (make) in
            make.center.equalTo(0)
        }
        
        let verifyRightBtn = UIButton.createBtn(nil, title: "获取验证码", image: nil, target: nil, action: nil)
        verifyRightBtn.setTitleColor(UIColor.grayColor(), forState: .Normal)
        verifyRightBtn.titleLabel?.font = UIFont.systemFontOfSize(15)
        verifyText?.rightView = verifyRightBtn
        verifyText?.rightViewMode = .Always
        verifyRight.addSubview(verifyRightBtn)
        
        verifyRight.snp_makeConstraints { (make) in
            
            make.size.equalTo(CGSizeMake(150, 50))
        }
        verifyRightBtn.snp_makeConstraints { (make) in
            
            make.center.equalTo(0)
            make.left.equalTo(20)
            
        }
        
        verifyRightBtn.layer.borderWidth = 1.0
        verifyRightBtn.layer.borderColor = UIColor.grayColor().CGColor
        verifyRightBtn.layer.cornerRadius = 5.0
        
    }
    
    
    
    func createRegisBtn() {
        
        let RegisBtn = UIButton.createBtn(nil, title: "注册", image: nil,target: nil,action: nil)
        RegisBtn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        self.view.addSubview(RegisBtn)
        RegisBtn.snp_makeConstraints { (make) in
            make.right.left.equalTo(0)
            make.top.equalTo((verifyText?.snp_bottom)!).offset(120)
            make.height.equalTo(60)
            
        }
        
        RegisBtn.jk_setBackgroundColor(UIColor.greenColor(), forState: .Normal)
        RegisBtn.jk_setBackgroundColor(UIColor.lightGrayColor(), forState: .Disabled)
        RegisBtn.jk_setBackgroundColor(UIColor.darkGrayColor(), forState: .Highlighted)
        RegisBtn.jk_handleControlEvents(.TouchUpInside) { (sender) in
            
            Alamofire.request(.POST, "https://www.1000phone.tk", parameters: [
                "service": "User.Resgister",
                "phone": self.userName!.text!,
                "password": self.password!.text!,
                "verificationCode": self.verifyText!.text!
                ], encoding: ParameterEncoding.URL, headers: nil).responseJSON(completionHandler: { (response) in
                    if response.result.isSuccess {
                        print(response.result.value!)
                        self.navigationController?.popViewControllerAnimated(true)
                    }else{
                        
                        CSUtil.showAlert(onViewController: self, msg: "网络请求失败", onfirmClosure: nil)
                    }
                })
        }
        
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
