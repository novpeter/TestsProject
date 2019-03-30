//
//  SettingsViewInput.swift
//  UnitTestsProject
//
//  Created by Петр on 27/03/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation

protocol SettingsViewInput: AnyObject {
    
    /// Sets values
    ///
    /// - Parameters:
    ///   - mediaType: media type
    ///   - softwareType: software type
    ///   - searchResultsCount: results count
    func setValues(mediaType: String, softwareType: String, searchResultsCount: Int)
}
