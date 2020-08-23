//
//  ProfileDetails.swift
//  ChatApp
//
//  Created by Raja Reddy on 20/08/20.
//  Copyright © 2020 Raja Reddy. All rights reserved.
//

import RealmSwift

class ProfileDetails: Object {
    
    @objc dynamic var emailId = ""
    @objc dynamic var password = ""
    @objc dynamic var phoneNumber = ""
    @objc dynamic var name = ""
    @objc dynamic var userId = ""
    
    convenience init(_ emailId: String, password: String, phoneNumber: String, name: String, userId: String) {
        self.init()
        
        self.emailId = emailId
        self.password = password
        self.phoneNumber = phoneNumber
        self.name = name
        self.userId = userId
    }
    
    public override static func primaryKey() -> String {
        return "emailId"
    }    
}
