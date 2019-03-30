//
//  SettingsModel.swift
//  UnitTestsProject
//
//  Created by Петр on 27/03/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers
class SettingsModel: Object {
    
    /// Identificator
    dynamic var id: String = String(describing: UUID.init())
    
    /// Type of media
    dynamic var mediaType: String = PickOptions.all.rawValue
    
    /// Count of search results
    dynamic var softwareType: String = "softwareType"
    
    /// Count of search results
    dynamic var searchResultsCount: Int = 1
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
