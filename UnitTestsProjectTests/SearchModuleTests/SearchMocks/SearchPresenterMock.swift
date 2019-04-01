//
//  SearchPresenterMock.swift
//  UnitTestsProjectTests
//
//  Created by Петр on 31/03/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation
@testable import UnitTestsProject

class SearchPresenterMock: SearchViewOutput {
    
    var searchCalled: Bool = false
    
    func search(for text: String?) {
        searchCalled = true
    }
}
