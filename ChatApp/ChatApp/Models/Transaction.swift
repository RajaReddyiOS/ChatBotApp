//
//  Transaction.swift
//  ChatApp
//
//  Created by Raja Reddy on 19/08/20.
//  Copyright © 2020 Raja Reddy. All rights reserved.
//

import RealmSwift

class Transactions: Object {
    @objc dynamic var time: Int64 = 0
    @objc dynamic var id = ""
    @objc dynamic var amount = 0
    @objc dynamic var userId = ""
    
    convenience init (_ time: Int64, id: String, amount: Int, userId: String) {
        self.init()
        
        self.time = time
        self.id = id
        self.amount = amount
        self.userId = userId
    }
    
    public override static func primaryKey() -> String {
        return "id"
    }
}
