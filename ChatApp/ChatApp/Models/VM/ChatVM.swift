//
//  ChatVM.swift
//  ChatApp
//
//  Created by Raja Reddy on 20/08/20.
//  Copyright © 2020 Raja Reddy. All rights reserved.
//

import Foundation

class ChatVM {
    
    static func getMyChatHistory() -> [Chat] {
        guard let profileDetails = ProfileVM.getMyProfileDetails() else {return []}
        return RealmUtils.getObjects(Chat.self, predicate: NSPredicate(format: "userId = %@", profileDetails.userId))
    }
    
    static func getMyChats() -> [String: [Chat]] {
        var hashMap = [String: [Chat]]()
        
        getMyChatHistory().sorted { (o1, o2) -> Bool in
            return o1.timestamp < o2.timestamp
        }.forEach { (chat) in
            let date = Date(timeIntervalSince1970: TimeInterval(chat.timestamp)).getDate()
            var list = hashMap[date] ?? []
            list.append(chat)
            list.sort { (c1, c2) -> Bool in
                return c1.timestamp > c2.timestamp
            }
            hashMap[date] = list
        }
        return hashMap
    }
}
