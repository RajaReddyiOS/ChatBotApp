//
//  DataUploader.swift
//  ChatApp
//
//  Created by Raja Reddy on 19/08/20.
//  Copyright © 2020 Raja Reddy. All rights reserved.
//

import Foundation

class DataUploader {
    
    static func writeBotPredefinedMessage(_ complitionHandler: @escaping() -> ()) {
        let count = ChatBotResponseVM.getAll().count
        [ChatBotResponse(["Hai","Hello","Is anyone there?"], response: "Hello", id: "\(count+1)"),
         ChatBotResponse(["Bye","See you later","Good Bye"], response: "See you later, thanks for visiting", id: "\(count+2)"),
         ChatBotResponse(["Thanks","Thank you","That's helpful"], response: "My pleasure", id: "\(count+3)")].forEach { (chatResponse) in
            RealmUtils.save(chatResponse)
        }
        complitionHandler()
    }
    
    static func writeTransactionsData(_ userId: String, _ complitionHandler: @escaping() -> ()) {
        let allTransactions = TransactionsVM.getAll()
        
        for i in 0...100 {
            RealmUtils.save(Transactions(Date.generateRandomTimestamps(), id: "\(allTransactions.count+i)", amount: Int.random(in: 100..<1000), userId: userId))
        }
        complitionHandler()
    }
    
    static func writeCompaniesData(_ complitionHandler: @escaping() -> ()) {
        let names = ["Reliance Inds",
        "Tata Consultancy",
        "HDFC Bank",
        "Hindustan Unilever",
        "Infosys",
        "Bharti Airtel",
        "Kotak Mahindra Bank",
        "ITC Limited",
        "ICICI Bank",
        "Maruti Suzuki India",
        "HCL Technologies",
        "Asian Paints Ltd",
        "SBI",
        "Wipro Ltd",
        "Nestle India",
        "Avenue Supermarts",
        "L&T",
        "Axis Bank Ltd",
        "Sun Pharma",
        "HDFC Life Insurance",
        "UltraTech Cement",
        "Titan Company",
        "ONGC",
        "Bajaj Finserv Ltd",
        "Hind. Zinc",
        "NTPC",
        "Bharat Petroleum",
        "Indian Oil Corp"]
        
        for i in 0..<names.count {
            RealmUtils.save(Company(names[i], id: "\(i+1)"))
        }
        
        complitionHandler()
    }
    
}
