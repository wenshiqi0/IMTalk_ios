//
//  TalkViewController.swift
//  IMTalk
//
//  Created by 文诗棋 on 15/7/19.
//  Copyright (c) 2015年 文诗棋. All rights reserved.
//

import UIKit

class TalkViewController : UIViewController ,UITableViewDelegate ,UITableViewDataSource{
    //@IBOutlet weak var talktest:UITextField!;
    var items : NSMutableArray = [];
    var topic : NSString = "";
    var lastViewController : UITableViewController! = nil;
    
    @IBOutlet weak var talktext:UITextField?;
    @IBOutlet var listview:UITableView?;
    
    let socket = SocketIOClient(socketURL: wsurl)
    
    override func viewDidLoad() {
        super.viewDidLoad();
        // 初始化tableView的数据
        self.listview!.delegate = self;
        self.listview!.dataSource = self;
        self.listview!.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell");
        self.view?.addSubview(self.listview!);
        
        self.socket.on("start"){data,ask in
            self.socket.emit("topic", self.topic);
        }
        
        self.socket.on(self.topic as String){ data,ask in
            self.items.addObject(data?[0] as! String);
            self.listview?.reloadData();
        }
        socket.connect();
    }
    
    @IBAction func confirm(){
        var text = self.talktext!.text;
        self.items.addObject(text as AnyObject);
        self.listview?.reloadData();
        socket.emit(topic as String, text);
        self.talktext!.text = "";
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        var strId = "cell";
        var cell = tableView.dequeueReusableCellWithIdentifier(strId, forIndexPath: indexPath) as! UITableViewCell;
        cell.textLabel!.text = self.items.objectAtIndex(indexPath.row) as? String;
        return cell;
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return talktext!.frame.height;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var header = UITableViewHeaderFooterView();
        header.contentView.backgroundColor = UIColor.whiteColor();
        return header;
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40;
    }
    
}
