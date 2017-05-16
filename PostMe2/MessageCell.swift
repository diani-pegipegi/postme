//
//  MessageCell.swift
//  PostMe2
//
//  Created by Diani Pavitri Rahasta on 5/15/17.
//  Copyright © 2017 Diani Pavitri Rahasta. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {
    
    @IBOutlet weak var msgTextLabel: UILabel!
    
    var msg: Message!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(msg: Message) {
        self.msg = msg
        self.msgTextLabel.text = msg.msgText
    }

}
