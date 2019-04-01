//
//  SearchViewControllerMock.swift
//  UnitTestsProjectTests
//
//  Created by Петр on 31/03/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation
@testable import UnitTestsProject

class SearchViewControllerMock: SearchViewInput {
    
    var updateContentCalled: Bool = false
    
    func updateContent(with models: [ResponseResult]) {
        updateContentCalled = true
    }

}
