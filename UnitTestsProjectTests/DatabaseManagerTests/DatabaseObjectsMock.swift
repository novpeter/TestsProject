//
//  DatabaseObjectsMock.swift
//  UnitTestsProjectTests
//
//  Created by Петр on 01/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation

import Foundation
import RealmSwift

@objcMembers
class UserModel: Object {
    
    /// Identificator
    dynamic var id: String = String(describing: UUID.init())
    
    /// Type of media
    dynamic var name: String = String()
    
    /// Count of search results
    dynamic var age: Int = 0
    
    /// Count of search results
    dynamic var followers: List<UserModel> = List<UserModel>()
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
