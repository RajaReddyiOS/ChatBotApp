//
//  UserDefaultsHelper.swift
//  ChatApp
//
//  Created by Raja Reddy on 18/08/20.
//  Copyright © 2020 Raja Reddy. All rights reserved.
//

import Foundation

class UserDefaultsHelper {
        
    static func save(_ value: Any?, for key: String) {
        UserDefaults.standard.set(value, forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    struct Keys {
        static let loggedInEmail = "loggedInEmail"
    }
    
    public static func get<T>(_ type: T.Type, key: String) -> T? {
        return UserDefaults.standard.value(forKey: key) as? T
    }
}
