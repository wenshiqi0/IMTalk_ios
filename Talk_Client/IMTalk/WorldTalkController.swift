//
//  WorldTalkController.swift
//  IMTalk
//
//  Created by 文诗棋 on 15/7/19.
//  Copyright (c) 2015年 文诗棋. All rights reserved.
//

import Foundation
import UIKit

class WorldTalkController: UITableViewController {
    var items : NSMutableArray = [];
    var height : CGFloat = 200.0;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        // 初始化tableView的数据
        UIApplication.sharedApplication().setStatusBarHidden(true, withAnimation: UIStatusBarAnimation.Slide);
        var list = NSArray(arrayLiteral: "a","b","c","d","e");
        self.items.addObjectsFromArray(list as [AnyObject]);
        self.tableView.registerNib(UINib(nibName: "NewsCell", bundle: nil), forCellReuseIdentifier: "NewsCell");
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var strId = "NewsCell";
        var cell:NewsCell = tableView.dequeueReusableCellWithIdentifier(strId, forIndexPath: indexPath) as! NewsCell;
        cell.title!.text = self.items.objectAtIndex(indexPath.row) as? String;
        return cell;
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 180;
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var header = UITableViewHeaderFooterView();
        header.contentView.backgroundColor = UIColor.whiteColor();
        return header;
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60;
    }
    
    override func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        var footer = UITableViewHeaderFooterView();
        footer.contentView.backgroundColor = UIColor.whiteColor();
        return footer;
    }
    
    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50;
    }
}




