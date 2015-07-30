//
//  SigninController.swift
//  IMTalk
//
//  Created by 文诗棋 on 15/7/19.
//  Copyright (c) 2015年 文诗棋. All rights reserved.
//

import Foundation
import UIKit

class SigninController: UIViewController {
    @IBOutlet weak var statu:UILabel!;
    @IBOutlet weak var name:UITextField!;
    @IBOutlet weak var pass:UITextField!;
    @IBOutlet weak var repass:UITextField!;
    
    var lastViewController:UIViewController! = nil;
    
    override func viewWillAppear(animated: Bool) {
        lastViewController = self.presentingViewController;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad();
    }
    
    @IBAction func back(){
        self.dismissViewControllerAnimated(true, completion: nil);
    }
    
    @IBAction func signin(){
        var flag = 0;
        self.statu.text = "";
        
        if(name.text == ""){
            self.statu.textColor = UIColor.redColor();
            self.statu.text = "please type your username";
            return;
        }
        
        if(pass.text != repass.text || pass.text == ""){
            self.statu.text = "please type the same password twice";
            self.statu.textColor = UIColor.redColor();
            return;
        }
        
        var request = HTTPTask();
        request.POST(httpurl+"user/", parameters: ["name":name.text,"pass":pass.text], completionHandler: {(
                response : HTTPResponse)in
            let err = response.error;
            if((err) != nil){
                if(err?.code == -1004){
                    flag = -1;
                    return;
                }
                flag = -2;
                print(err);
            }else{
                if(response.statusCode == 204){
                    flag = 204;
                    return;
                }
                if(response.statusCode == 200){
                    flag = 200;
                    return;
                }
                if(response.statusCode == 404){
                    flag = 404;
                    return;
                }
              
            }
        })
        while(flag == 0){
            
        }
        switch(flag){
        case -1:
            self.statu.text = "Server Not On Service";
            self.statu.textColor = UIColor.orangeColor();
            break;
        case -2:
            self.statu.text = "Prog Error,Please Tell Us";
            self.statu.textColor = UIColor.grayColor();
            break;
        case 204:
            self.statu.text = "You Are The New Member Now,Welcome";
            self.statu.textColor = UIColor.greenColor();
            let viewtogo:UIViewController = self.storyboard!.instantiateViewControllerWithIdentifier("login") as! UIViewController;
            self.presentViewController(viewtogo, animated: true, completion: nil);
            break;
        case 200:
            self.statu.text = "Already Have This Member";
            self.statu.textColor = UIColor.greenColor();
            let viewtogo:UIViewController = self.storyboard!.instantiateViewControllerWithIdentifier("login") as! UIViewController;
            self.presentViewController(viewtogo, animated: true, completion: nil);
            break;
        case 404:
            self.statu.text = "Server Error";
            self.statu.textColor = UIColor.redColor();
            break;
        default:
            self.statu.text = "Unkown Error";
            self.statu.textColor = UIColor.redColor();
        }
        
    }
}