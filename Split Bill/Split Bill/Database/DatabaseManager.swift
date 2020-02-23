//
//  DatabaseManager.swift
//  Split Bill
//
//  Created by Sashen Pillay on 2020/01/04.
//  Copyright © 2020 Sashen Pillay. All rights reserved.
//

import Foundation
import RealmSwift

public class DatabaseManager {
    
    var database: Realm?
    
    init() {
        do {
            database = try Realm()
        } catch {
            debugPrint("ERROR: Cannot instantiate Realm databse")
        }
    }
    
    func saveToDatabase(object: Object) {
        do {
            try database?.write {
                    database?.add(object)
                }
            } catch {
                debugPrint("ERROR: Failed to write to database")
            }
    }
    
    func fetchFromDatabase<Element: Object>(_ type: Element.Type) -> Results<Element>?  {
        return database?.objects(type) ?? nil
    }

}
