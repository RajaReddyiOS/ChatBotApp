//
//  TransactionsVM.swift
//  ChatApp
//
//  Created by Raja Reddy on 20/08/20.
//  Copyright © 2020 Raja Reddy. All rights reserved.
//

import Foundation

class TransactionsVM {
    
    static func getAll() -> [Transactions] {
        return RealmUtils.getObjects(Transactions.self)
    }
    
    static func getMyTransactions() -> [Transactions] {
        guard let profileDetails = ProfileVM.getMyProfileDetails() else {return []}
        
        return RealmUtils.getObjects(Transactions.self, predicate: NSPredicate(format: "userId = %@", profileDetails.userId)).sorted { (o1, o2) -> Bool in
            return o1.time > o2.time
        }
    }
    
}
