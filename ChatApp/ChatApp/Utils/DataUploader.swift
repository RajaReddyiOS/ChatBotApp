//
//  DataUploader.swift
//  ChatApp
//
//  Created by Raja Reddy on 19/08/20.
//  Copyright © 2020 Raja Reddy. All rights reserved.
//

import Foundation

class DataUploader {
    
    static func writeTransactionsData(_ userId: String, _ complitionHandler: @escaping() -> ()) {
        DispatchQueue.global(qos: DispatchQoS.QoSClass.background).async {
            let allTransactions = TransactionsVM.getAll()
            
            for i in 0...100 {
                RealmUtils.save(Transactions(Date.generateRandomTimestamps(), id: "\(allTransactions.count+i)", amount: Int.random(in: 100..<1000), userId: userId))
            }
            complitionHandler()
        }
    }
    
    static func writeCompaniesData(_ complitionHandler: @escaping() -> ()) {
        DispatchQueue.global(qos: DispatchQoS.QoSClass.background).async {
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
    
}
