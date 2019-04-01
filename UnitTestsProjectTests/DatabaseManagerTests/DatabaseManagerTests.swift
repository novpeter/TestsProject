//
//  DatabaseManagerTests.swift
//  UnitTestsProjectTests
//
//  Created by Петр on 01/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import XCTest
import RealmSwift
@testable import UnitTestsProject

class DatabaseManagerTests: TestCaseBase {

    fileprivate var databaseManager: DatabaseManagerProtocol!
    
    override func setUp() {
        databaseManager = DatabaseManager()
    }

    override func tearDown() {
        
        databaseManager.clearAll()
        databaseManager = nil
    }

    func testSaveAndGetObjects() {
        
        // Given
        let user1 = UserModel()
        let user2 = UserModel()

        user1.setValuesForKeys(["name": "Petr", "age": 20, ])
        user2.setValuesForKeys(["name": "Anton", "age": 18 ])

        // When

        databaseManager.saveObjects(objects: [user1, user2])

        // Then
        XCTAssertFalse(databaseManager.getObjects(with: UserModel.self)?.isEmpty ?? false, "Storage is empty")
    }
    
    func testDeleteValues() {
        
        // Given
        let user = UserModel()
        user.setValuesForKeys(["name": "Petr", "age": 20, ])
        
        // When
        databaseManager.saveObjects(objects: [user])
        databaseManager.deleteObjects(objects: [user])
        
        // Then
        XCTAssertTrue(databaseManager.getObjects(with: UserModel.self)?.isEmpty ?? false, "Storage is not empty")
    }
    
    func testPerformTransaction() {
        
        // Given
        let user = UserModel()
        let newAge = 30
        user.setValuesForKeys(["name": "Petr", "age": 20])
        
        // When
        databaseManager.saveObjects(objects:  [user])
        databaseManager.performTransaction {
            
            user.age = newAge
        }

        // Then
        XCTAssertEqual(newAge, user.age, "Ages are not equal")
    }
}
