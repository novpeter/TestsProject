//
//  SearchPresenterTests.swift
//  UnitTestsProjectTests
//
//  Created by Петр on 31/03/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import XCTest
import RealmSwift
@testable import UnitTestsProject

class SearchPresenterTests: TestCaseBase {
    
    /// Search presenter
    var searchPresenter: SearchPresenter!

    
    override func setUp() {
        searchPresenter = SearchPresenter()
    }

    override func tearDown() {
        searchPresenter = nil
    }

    
    func testSearch() {
        
        // Given
        let searchText = "cat"
        
        let databaseManager = DatabaseManager()
        let networkManager = NetworkManager()
        let decoder = JSONDecoder()
        let view = SearchViewControllerMock()
        
        searchPresenter.databaseManager = databaseManager
        searchPresenter.networkManager = networkManager
        searchPresenter.decoder = decoder
        searchPresenter.view = view
        
        // When
        searchPresenter.search(for: searchText)
        
        // Then
        // XCTAssertTrue(view.updateContentCalled, "Update content was not called")
    }

    func testSearchWithNil() {
        
        // Given
        let databaseManager = DatabaseManager()
        let networkManager = NetworkManager()
        let decoder = JSONDecoder()
        let view = SearchViewControllerMock()
        
        searchPresenter.databaseManager = databaseManager
        searchPresenter.networkManager = networkManager
        searchPresenter.decoder = decoder
        searchPresenter.view = view
        
        // When
        searchPresenter.search(for: nil)
        
        // Then
        XCTAssertFalse(view.updateContentCalled, "Update content was not called")
    }
    
}
