//
//  ViewController.swift
//  PostMe2
//
//  Created by Diani Pavitri Rahasta on 5/15/17.
//  Copyright © 2017 Diani Pavitri Rahasta. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var tweetIn: UITextField!
    
    var msgs = [Message]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        DataService.ds.MSGS_DB_REF.queryOrdered(byChild: "postedDate").observe(.value, with: { (snapshot) in
            
            self.msgs = []
            
            if let snapshot = snapshot.children.allObjects as? [FIRDataSnapshot] {
                for snap in snapshot {
                    if let postDict = snap.value as? [String: AnyObject] {
                        let message = Message(msgId: snap.key, msgData: postDict)
                        self.msgs.append(message)
                        //self.msgs.insert(message, at: 0)
                    }
                }
            }
            self.table.reloadData()
        })
        
        table.delegate = self
        table.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return msgs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let msg = msgs[indexPath.row]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "MessageCell") as? MessageCell {
            cell.configureCell(msg: msg)
            return cell
        } else {
            return MessageCell()
        }
    }
    
    @IBAction func tweetBtn(sender: UIButton) {
        
        if let msgText = tweetIn.text , !msgText.isEmpty {
            let msg = [
                "text": msgText,
                "postedDate": FIRServerValue.timestamp()
                ] as [String : Any]
            
            let fireMsg = DataService.ds.MSGS_DB_REF.childByAutoId()
            fireMsg.setValue(msg)
            
            tweetIn.text = ""
            table.reloadData()
        }
    }
}

