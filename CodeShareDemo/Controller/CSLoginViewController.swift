//
//  CSLoginViewController.swift
//  CodeShareDemo
//
//  Created by 千锋 on 16/10/11.
//  Copyright © 2016年 LRC. All rights reserved.
//

import UIKit
import SnapKit
import JKCategories
import Alamofire
class CSLoginViewController: UIViewController {

    var userName: UITextField?
    var password: UITextField?
    var forgetBtn: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.whiteColor()
        self.title = "登录"
        
        //用户名
        createUserName()
        
        //密码
        createPassword()
        
        //忘记密码按钮
        createForgetBtn()
        
        //登录按钮
        createLoginBtn()
        
        //导航按钮
        createNavBtn()
    
    }
    
    //导航按钮
    func createNavBtn() {
        
        let backBtn = UIButton.createBtn(CGRectMake(0, 0, 50, 40), title: nil, image: UIImage(named: "返回按钮"),target: nil,action: nil)
        let backItem = UIBarButtonItem(customView: backBtn)
        self.navigationItem.leftBarButtonItem = backItem
        let registerBtn = UIButton.createBtn(CGRectMake(0, 0, 50, 40), title: "注册", image: nil,target: self,action: #selector(resginAction))
        registerBtn.setTitleColor(UIColor.blackColor(), forState: .Normal)
        let registerItem = UIBarButtonItem(customView: registerBtn)
        self.navigationItem.rightBarButtonItem = registerItem
        
    }
    
    func resginAction() {
        
        let regisVC = CSRegisterViewController()
        self.navigationController?.pushViewController(regisVC, animated: true)
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
    
    func createForgetBtn() {
        
        forgetBtn = UIButton.createBtn(nil, title: "忘记密码?", image: nil,target: nil,action: nil)
        forgetBtn?.setTitleColor(UIColor.darkGrayColor(), forState: .Normal)
        forgetBtn?.titleLabel?.font = UIFont.systemFontOfSize(15)
        self.view.addSubview(forgetBtn!)
        forgetBtn?.snp_makeConstraints(closure: { (make) in
            
            make.right.equalTo(0)
            make.top.equalTo((password?.snp_bottom)!)
            make.width.equalTo(80)
            make.height.equalTo(60)
            
        })
        
    }
    
    func createLoginBtn() {
        
        let loginBtn = UIButton.createBtn(nil, title: "登录", image: nil,target: nil,action: nil)
        loginBtn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        self.view.addSubview(loginBtn)
        loginBtn.snp_makeConstraints { (make) in
            make.right.left.equalTo(0)
            make.top.equalTo((forgetBtn?.snp_bottom)!).offset(120)
            make.height.equalTo(60)
            
        }
        
        loginBtn.jk_setBackgroundColor(UIColor.greenColor(), forState: .Normal)
        loginBtn.jk_setBackgroundColor(UIColor.lightGrayColor(), forState: .Disabled)
        loginBtn.jk_setBackgroundColor(UIColor.darkGrayColor(), forState: .Highlighted)
        loginBtn.jk_handleControlEvents(.TouchUpInside) { (sender) in
            
            Alamofire.request(.POST, "https://www.1000phone.tk", parameters: [
                "service": "User.Login",
                "phone": self.userName!.text!,
                "password": self.password!.text!
                ], encoding: ParameterEncoding.URL, headers: nil).responseJSON(completionHandler: { (response) in
                    if response.result.isSuccess {
                        print(response.result.value!)
                        self.dismissViewControllerAnimated(true, completion: nil)
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
