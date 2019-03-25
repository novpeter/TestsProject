//
//  UnitTestsTests.swift
//  UnitTestsTests
//
//  Created by Ильдар Залялов on 25/03/2019.
//  Copyright © 2019 Ильдар Залялов. All rights reserved.
//

import XCTest
@testable import UnitTests

class UnitTestsTests: XCTestCase {
    
    var viewController: ViewController!
    
    override func setUp() {
        
        viewController = ViewController()
    }

    override func tearDown() {
        viewController = nil
    }

    func testCalculate() {
        
        // Given
        
        let x = 10
        let y = 15
        let finalResult = x + y
        
        // When
        
        let result = viewController.calculate(x: x, y: y)
        
        //Then
        
        XCTAssertEqual(finalResult, result, "Result not correct!")
    }
    
    func testCalculateGuardStatement() {
        
        // Given
        
        let x = 0
        let y = 15
        let finalResult = y
        
        // When
        
        let result = viewController.calculate(x: x, y: y)
        
        //Then
        
        XCTAssertEqual(finalResult, result, "Result not correct!")
    }
    
    ///TDD
    
    func testHasDecimalNumbersWithNumbers() {
        
        //Given
        
        let stringToTest = "asdas1231asd"
        let expectationResult = true
        
        //When
        
        let result = viewController.hasDecimalNumbers(stringToTest)
        
        //Then
        
        XCTAssertTrue(expectationResult == result, "Not correct!")
    }
    
    func testHasDecimalNumbersWithoutNumbers() {
        
        //Given
        
        let stringToTest = "asdasasd"
        let expectationResult = false
        
        //When
        
        let result = viewController.hasDecimalNumbers(stringToTest)
        
        //Then
        
        XCTAssertTrue(expectationResult == result, "Not correct!")
    }
    
    func testHasDecimalNumbersWithEmptyValue() {
        
        //Given
        
        let stringToTest = " "
        let expectationResult = false
        
        //When
        
        let result = viewController.hasDecimalNumbers(stringToTest)
        
        //Then
        
        XCTAssertTrue(expectationResult == result, "Not correct!")
    }
}
