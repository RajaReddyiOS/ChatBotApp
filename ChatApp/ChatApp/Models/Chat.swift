//
//  Chat.swift
//  ChatApp
//
//  Created by Raja Reddy on 20/08/20.
//  Copyright © 2020 Raja Reddy. All rights reserved.
//

import RealmSwift

class Chat: Object {
    
    @objc dynamic var userId = ""
    @objc dynamic var timestamp: Int64 = 0
    @objc dynamic var message = ""
    @objc dynamic var type = ""
    
    convenience init(_ userId: String, timestamp: Int64, message: String, type: String) {
        self.init()
 
        self.userId = userId
        self.timestamp = timestamp
        self.message = message
        self.type = type
    }
    
}
