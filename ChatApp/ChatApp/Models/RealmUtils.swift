//
//  RealmUtils.swift
//  ChatApp
//
//  Created by Raja Reddy on 19/08/20.
//  Copyright © 2020 Raja Reddy. All rights reserved.
//

import RealmSwift

class RealmUtils {
    
    fileprivate static let TAG = String(describing: RealmUtils.self)
    
    public static func save(_ object: Object, saved: ((_ isSaved: Bool) -> ())? = nil) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(object, update: Realm.UpdatePolicy.all)
            }
        } catch let error {
            print("\(TAG): Non-Fatal Exception: \(#function), of type: \(String(describing: object.self)) and error: \(String(describing: error))")
        }
    }
    
    public static func getObject<T: Object>(_ type: T.Type, primaryKey: String) -> T?  {
        do {
            let realm = try Realm()
            return realm.object(ofType: type, forPrimaryKey: primaryKey)
        } catch let error {
            print(TAG+": Non-Fatal Exception at \(#function) of type: \(String(describing: T.self)): \(String(describing: error))")
        }
        return nil
    }
    
    public static func getObject<Element: Object>(_ type: Element.Type, predicate: NSPredicate? = nil) -> Element?  {
        do {
            let realm = try Realm()
            if predicate == nil {
                return realm.objects(type).last
            }else {
                return realm.objects(type).filter(predicate!).last
            }
        } catch let error {
            print(TAG+": Non-Fatal Exception at \(#function) of type: \(String(describing: Element.self)): \(String(describing: error))")
        }
        return nil
    }
    
    public static func getObjects<Element: Object>(_ type: Element.Type, predicate: NSPredicate? = nil) -> [Element]  {
        do {
            let realm = try Realm()
            if predicate == nil {
                return Array(realm.objects(type))
            }else {
                return Array(realm.objects(type).filter(predicate!))
            }
        } catch let error {
            print(TAG+": Non-Fatal Exception at \(#function) of type: \(String(describing: Element.self)): \(String(describing: error))")
        }
        return []
    }
    
    public static func toList<T: Any>(_ type: T.Type, data: [T]) -> List<T> {
        let list = List<T>()
        data.forEach { (each) in
            list.append(each)
        }
        return list
    }
    
    public static func getObjects<Element: Object>(_ type: Element.Type, filter: String) -> [Element]  {
        do {
            let realm = try Realm()
            return Array(realm.objects(type).filter(filter))
        } catch let error {
            print(TAG+": Non-Fatal Exception at \(#function) of type: \(String(describing: Element.self)): \(String(describing: error))")
        }
        return []
    }
}
