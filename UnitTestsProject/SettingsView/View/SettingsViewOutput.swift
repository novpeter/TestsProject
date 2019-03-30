//
//  SettingsViewOutput.swift
//  UnitTestsProject
//
//  Created by Петр on 27/03/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation

protocol SettingsViewOutput: AnyObject {
    
    /// Sets media type
    ///
    /// - Parameter type: media type
    func setMediaType(type: String?)
    
    /// Sets search results count
    ///
    /// - Parameter count: count
    func setSearchResultsCount(count: Int)
    
    /// Sets values in view
    func setInitialState()
    
    /// Sets software type
    ///
    /// - Parameter type: software type
    func setSoftwareType(_ type: String)
}
