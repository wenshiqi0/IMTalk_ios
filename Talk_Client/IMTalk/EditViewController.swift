//
//  EditViewController.swift
//  IMTalk
//
//  Created by 文诗棋 on 15/7/21.
//  Copyright (c) 2015年 文诗棋. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {
    
    @IBOutlet weak var newsTitle:UITextField!;
    @IBOutlet weak var statu:UILabel!;

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func add(){
        var request = HTTPTask();
        var flag = 0;
        request.POST(httpurl+"topic/", parameters: ["title":newsTitle.text], completionHandler: {(
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
                if(response.statusCode == 204){
                    flag = 204;
                    return;
                }
                if(response.statusCode == 200){
                    flag = 200;
                    return;
                }
                flag = 400;
            }
        })
        while(flag == 0){
            
        }
        switch(flag){
        case -1:
            self.statu.text = "Server Not On Server";
            self.statu.textColor = UIColor.orangeColor();
            break;
        case -2:
            self.statu.text = "Prog Error,Please Tell Us";
            self.statu.textColor = UIColor.grayColor();
            break;
        case 204:
            self.statu.text = "Success to make a new Topic"
            self.statu.textColor = UIColor.greenColor();
            break;
        case 200:
            self.statu.text = "Already have this topic";
            self.statu.textColor = UIColor.greenColor();
            break;
        case 404:
            self.statu.text = "Failed to make topics";
            self.statu.textColor = UIColor.redColor();
            break;
        default:
            self.statu.text = "Unkown Error";
            self.statu.textColor = UIColor.redColor();
        }
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
