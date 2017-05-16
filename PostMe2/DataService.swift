//
//  DataService.swift
//  PostMe2
//
//  Created by Diani Pavitri Rahasta on 5/15/17.
//  Copyright © 2017 Diani Pavitri Rahasta. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

let DB_BASE = FIRDatabase.database().reference()

class DataService {
    static let ds = DataService()
    
    var MSGS_DB_REF = DB_BASE.child("messages")
    
}
