i//
//  ViewController.swift
//  IMTalk
//
//  Created by 文诗棋 on 15/7/18.
//  Copyright (c) 2015年 文诗棋. All rights reserved.
//

import UIKit

let httpurl = "http://localhost:3001/";
let wsurl = "localhost:3001";

class ViewController: UIViewController {
    
    @IBOutlet var username:UITextField!;
    @IBOutlet var password:UITextField!;
    @IBOutlet var loginLog:UILabel!;
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signin(){
        let viewtogo:SigninController = self.storyboard!.instantiateViewControllerWithIdentifier("signin") as! SigninController;
        self.presentViewController(viewtogo, animated: true, completion: nil);
    }
    
    @IBAction func login(){
        var request = HTTPTask();
        var flag = 0;
        
        request.GET(httpurl+"user/"+username.text, parameters: nil, completionHandler: {(
            response : HTTPResponse)in
            let err = response.error;
            if((err) != nil){
                if(err?.code == -1004){
                    flag = -1;
                    return;
                }
                flag = 2;
                print(err);
            }else{
                let data = response.responseObject as? NSData;
                if(data == nil){
                    flag = 2;
                    return;
                }
                let dict :NSDictionary = NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers, error: nil) as! NSDictionary;
                if(dict["pass"] != nil && dict["pass"] as? NSString == self.password.text){
                    flag = 1;
                    return;
                }else{
                    flag = 2;
                    return;
                }
            }
        })
        while(flag==0){
            
        }
        if(flag == -1){
            self.loginLog.textColor = UIColor.orangeColor();
            self.loginLog.text = "Server Not On Serveice";
        }
        if(flag == 1){
            self.loginLog.text = "Login Success,Welcom";
            self.loginLog.textColor = UIColor.greenColor();
            let viewtogo:UITabBarController = self.storyboard!.instantiateViewControllerWithIdentifier("main") as! UITabBarController;
            var navigation = UINavigationController(rootViewController: viewtogo);
            self.presentViewController(navigation, animated: true, completion: nil);
        }
        if(flag == 2){
            self.loginLog.text = "Wrong Username Or Password";
            self.loginLog.textColor = UIColor.redColor();
        }
        
        
    }
}

