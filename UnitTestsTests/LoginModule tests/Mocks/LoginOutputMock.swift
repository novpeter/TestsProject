//
//  LoginOutputMock.swift
//  UnitTestsTests
//
//  Created by Ильдар Залялов on 25/03/2019.
//  Copyright © 2019 Ильдар Залялов. All rights reserved.
//

import Foundation
@testable import UnitTests

class LoginOutputMock: LoginViewOutput {
    
    var isSetupInitialStateCalled = false
    
    func setupInitialState() {
        isSetupInitialStateCalled = true
    }
    
}
