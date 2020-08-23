//
//  ChatBotResponse.swift
//  ChatApp
//
//  Created by Raja Reddy on 23/08/20.
//  Copyright © 2020 Raja Reddy. All rights reserved.
//

import RealmSwift

class ChatBotResponse: Object {
    
    var questions = List<String>()
    @objc dynamic var response = ""
    @objc dynamic var id = ""
    convenience init(_ questions: [String], response: String, id: String) {
        self.init()
        
        self.questions = RealmUtils.toList(String.self, data: questions)
        self.response = response
        self.id = id
    }
    
    public override static func primaryKey() -> String {
        return "id"
    }
}
