//
//  SettingsViewOutputTests.swift
//  UnitTestsProjectTests
//
//  Created by Петр on 31/03/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import XCTest
import UIKit
@testable import UnitTestsProject

class SettingsPresenterTests: TestCaseBase {
    
    /// Settings view controller
    var settingsViewControllerMock: SettingsViewControllerMock!
    
    /// Settings presenter
    var settingsPresenter: SettingsPresenter!

    
    override func setUp() {
        
        settingsViewControllerMock = SettingsViewControllerMock()
        settingsPresenter = SettingsPresenter()
        settingsPresenter.view = SettingsViewControllerMock()
        settingsPresenter.databaseManager = DatabaseManager()
        settingsPresenter.currentSettings = SettingsModel()
    }

    override func tearDown() {
        
        settingsViewControllerMock = nil
        settingsPresenter = nil
    }

    func testSetWrongMediaType() {
        
        // Given
        let mediaType = "test"
        
        // When
        settingsPresenter.setMediaType(type: mediaType)
        
        // Then
        XCTAssertFalse(settingsViewControllerMock.setValuesCalled)
    }

    func testSetMediaType() {
        
        // Given
        let mediaType = MediaPickOptions.all.rawValue
        
        // When
        settingsPresenter.setMediaType(type: mediaType)
        
        // Then
        XCTAssertEqual(settingsPresenter.currentSettings.mediaType, mediaType)
    }
    
    func testSetNilMediaType() {
        
        // Given
        
        // When
        settingsPresenter.setMediaType(type: nil)
        
        // Then
        XCTAssertFalse(settingsViewControllerMock.setValuesCalled)
    }
    
    func testSetSearchResultsCount() {
        
        // Given
        let searchResultsCount = 20
        
        // When
        settingsPresenter.setSearchResultsCount(count: searchResultsCount)
        
        // Then
        XCTAssertEqual(settingsPresenter.currentSettings.searchResultsCount, searchResultsCount)
    }
    
    func testSetWrongSearchResultsCount() {
        
        // Given
        let searchResultsCount = 201
        
        // When
        settingsPresenter.setSearchResultsCount(count: searchResultsCount)
        
        // Then
        XCTAssertEqual(settingsPresenter.currentSettings.searchResultsCount, 1)
    }
    
    func testSetSoftwareType() {
        
        // Given
        let softwareType = softwareTypes[1]
        
        // When
        settingsPresenter.setSoftwareType(softwareType)
        
        // Then
        XCTAssertEqual(settingsPresenter.currentSettings.softwareType, softwareTypes[1])
    }
    
    func testSetWrongSoftwareType() {
        
        // Given
        let softwareType = "test"
        
        // When
        settingsPresenter.setSoftwareType(softwareType)
        
        // Then
        XCTAssertEqual(settingsPresenter.currentSettings.softwareType, "softwareType")
    }
}
