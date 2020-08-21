//
//  CompanyVM.swift
//  ChatApp
//
//  Created by Raja Reddy on 19/08/20.
//  Copyright © 2020 Raja Reddy. All rights reserved.
//

import Foundation

class CompaniesVM {
    static func getCompanies() -> [Company] {
        return RealmUtils.getObjects(Company.self)
    }
}
