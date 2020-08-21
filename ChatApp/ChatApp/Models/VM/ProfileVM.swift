//
//  UserVM.swift
//  ChatApp
//
//  Created by Raja Reddy on 20/08/20.
//  Copyright © 2020 Raja Reddy. All rights reserved.
//

import Foundation

class ProfileVM {
    
    static func getProfileDetails(by emailId: String) -> ProfileDetails? {
        return RealmUtils.getObject(ProfileDetails.self, primaryKey: emailId)
    }
    
    static func getAll() -> [ProfileDetails] {
        return RealmUtils.getObjects(ProfileDetails.self)
    }
    
    static func getLoggedInEmail() -> String? {
        return UserDefaultsHelper.get(String.self, key: UserDefaultsHelper.Keys.loggedInEmail)
    }
    
    static func getMyProfileDetails() -> ProfileDetails? {
        guard let email = getLoggedInEmail() else { return nil }
        return RealmUtils.getObject(ProfileDetails.self, primaryKey: email)
    }
    
}
