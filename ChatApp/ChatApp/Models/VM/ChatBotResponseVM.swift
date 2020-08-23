//
//  ChatBotResponseVM.swift
//  ChatApp
//
//  Created by Raja Reddy on 23/08/20.
//  Copyright © 2020 Raja Reddy. All rights reserved.
//

import RealmSwift

class ChatBotResponseVM {
    static func getResponse(by question: String) -> String {
        let filterList = RealmUtils.getObjects(ChatBotResponse.self).filter { (response) -> Bool in
            return response.questions.contains(where: {$0.caseInsensitiveCompare(question) == .orderedSame})
        }
        return filterList.first?.response ?? "Sorry i didn't understand, am still in learning mode, Thank you for reaching us"
    }
    
    static func getAll() -> [ChatBotResponse] {
        return RealmUtils.getObjects(ChatBotResponse.self)
    }
}
