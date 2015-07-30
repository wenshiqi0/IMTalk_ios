//
//  FriendCell.swift
//  IMTalk
//
//  Created by 文诗棋 on 15/7/19.
//  Copyright (c) 2015年 文诗棋. All rights reserved.
//

import Foundation
import UIKit

class NewsCell : UITableViewCell {
    @IBOutlet weak var title : UILabel!;
    @IBOutlet weak var img : UIImageView!;
    
    override func awakeFromNib() {
        super.awakeFromNib();
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated);
    }
    
}