//
//  SettingsViewOutputMock.swift
//  UnitTestsProjectTests
//
//  Created by Петр on 29/03/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation
@testable import UnitTestsProject

class SettingsPresenterMock: SettingsViewOutput {
    
    public var setInitialStateCalled = false
    public var setMediaTypeCalled = false
    public var setSearchResultsCountCalled = false
    public var setSoftwareTypeCalled = false
    
    func setMediaType(type: String?) {
        setMediaTypeCalled = true
    }
    
    func setSearchResultsCount(count: Int) {
        setSearchResultsCountCalled = true
    }
    
    func setInitialState() {
        setInitialStateCalled = true
    }
    
    func setSoftwareType(_ type: String) {
        setSoftwareTypeCalled = true
    }

}
