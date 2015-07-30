//
//  FriendTalkController.swift
//  IMTalk
//
//  Created by 文诗棋 on 15/7/19.
//  Copyright (c) 2015年 文诗棋. All rights reserved.
//

import Foundation
import UIKit

class TopicTalkController: UITableViewController {
    var items : NSMutableArray = [];
    
    override func viewDidLoad() {
        super.viewDidLoad();
        // 初始化tableView的数据
        UIApplication.sharedApplication().setStatusBarHidden(true, withAnimation: UIStatusBarAnimation.Slide);
        var list = NSArray(arrayLiteral: "news","gogo","wenko");
        self.items.addObjectsFromArray(list as [AnyObject]);
        self.tableView.registerNib(UINib(nibName: "TopicCell", bundle: nil), forCellReuseIdentifier: "TopicCell");
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var strId = "TopicCell";
        var cell:TopicCell = tableView.dequeueReusableCellWithIdentifier(strId, forIndexPath: indexPath) as! TopicCell;
        if(items.count == 0){
            cell = TopicCell();
            return cell;
        }
        cell.name!.text = self.items.objectAtIndex(indexPath.row) as? String;
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var topic: AnyObject = self.items.objectAtIndex(indexPath.row);
        let viewtogo:TalkViewController = self.storyboard!.instantiateViewControllerWithIdentifier("talk") as! TalkViewController;
        viewtogo.topic = topic as! NSString;
        self.navigationController?.pushViewController(viewtogo, animated: true);
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return TopicCell().frame.height;
    }
    
    func getTopic(){
        
    }
    
}
