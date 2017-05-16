//
//  Message.swift
//  PostMe2
//
//  Created by Diani Pavitri Rahasta on 5/15/17.
//  Copyright © 2017 Diani Pavitri Rahasta. All rights reserved.
//

import Foundation

class Message {
    var msgId: String!
    var msgText: String!
    var postedDate: String!
    
    init(msgId: String, msgData: [String: AnyObject]) {
        self.msgId = msgId
        
        if let msgText = msgData["text"] as? String {
            self.msgText = msgText
        }
        
        if let postedDate = msgData["postedDate"] as? String {
            self.postedDate = postedDate
        }
    }

}
