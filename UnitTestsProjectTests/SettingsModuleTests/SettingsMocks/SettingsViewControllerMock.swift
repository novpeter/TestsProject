//
//  SettingsViewControllerMock.swift
//  UnitTestsProjectTests
//
//  Created by Петр on 31/03/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation
import UIKit
@testable import UnitTestsProject

class SettingsViewControllerMock: SettingsViewInput {

    var setValuesCalled: Bool = false
    
    func setValues(mediaType: String, softwareType: String, searchResultsCount: Int) {
        setValuesCalled = true
    }
    
}
