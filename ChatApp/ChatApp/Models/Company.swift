//
//  Company.swift
//  ChatApp
//
//  Created by Raja Reddy on 18/08/20.
//  Copyright © 2020 Raja Reddy. All rights reserved.
//

import RealmSwift

class Company: Object {
    
    @objc dynamic var name = ""
    @objc dynamic var id = ""
    
    convenience init(_ name: String, id: String) {
        self.init()
        
        self.name = name
        self.id = id
    }
    
    public override static func primaryKey() -> String {
        return "id"
    }
}
