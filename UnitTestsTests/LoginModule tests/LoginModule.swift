//
//  LoginModule.swift
//  UnitTestsTests
//
//  Created by Ильдар Залялов on 25/03/2019.
//  Copyright © 2019 Ильдар Залялов. All rights reserved.
//

import XCTest
@testable import UnitTests

class LoginModule: XCTestCase {

    var loginController: LoginViewController!
    
    override func setUp() {
        
        loginController = LoginViewController()
        loginController.output = LoginOutputMock()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSetupInitialStateCalled() {
        
        //Given
        let output = loginController.output
        
        //when
        loginController.viewDidLoad()
        
        //then
        XCTAssertTrue(output is LoginOutputMock, "Not mocked")
        XCTAssertTrue((output as! LoginOutputMock).isSetupInitialStateCalled, "Not called")
    }
    
    func testCalculate() {
        
        // Given
        
        let x = 10
        let y = 15
        let finalResult = x + y
        
        // When
        
        let result = loginController.calculate(x: x, y: y)
        
        //Then
        
        XCTAssertEqual(finalResult, result, "Result not correct!")
    }
    
    func testCalculateGuardStatement() {
        
        // Given
        
        let x = 0
        let y = 15
        let finalResult = y
        
        // When
        
        let result = loginController.calculate(x: x, y: y)
        
        //Then
        
        XCTAssertEqual(finalResult, result, "Result not correct!")
    }
    
    ///TDD
    
    func testHasDecimalNumbersWithNumbers() {
        
        //Given
        
        let stringToTest = "asdas1231asd"
        let expectationResult = true
        
        //When
        
        let result = loginController.hasDecimalNumbers(stringToTest)
        
        //Then
        
        XCTAssertTrue(expectationResult == result, "Not correct!")
    }
    
    func testHasDecimalNumbersWithoutNumbers() {
        
        //Given
        
        let stringToTest = "asdasasd"
        let expectationResult = false
        
        //When
        
        let result = loginController.hasDecimalNumbers(stringToTest)
        
        //Then
        
        XCTAssertTrue(expectationResult == result, "Not correct!")
    }
    
    func testHasDecimalNumbersWithEmptyValue() {
        
        //Given
        
        let stringToTest = " "
        let expectationResult = false
        
        //When
        
        let result = loginController.hasDecimalNumbers(stringToTest)
        
        //Then
        
        XCTAssertTrue(expectationResult == result, "Not correct!")
    }

    func testCalculateAsync() {
        
        // Given
        
        let x = 10
        let y = 15
        let finalResult = x + y
        
        let resultExpectation = expectation(description: "Calculate")
        
        // When
       
        
        loginController.calculate(x: x, y: y) { (result) in
            
            //Then
            XCTAssertEqual(finalResult, result, "Result not correct!")
            
            resultExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 3.0) { (error) in
            
            if error != nil {
                XCTFail("Expectation failed")
            }
        }
    }
}
