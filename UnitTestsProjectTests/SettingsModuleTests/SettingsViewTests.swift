//
//  SettingsViewInputTests.swift
//  UnitTestsProjectTests
//
//  Created by Петр on 31/03/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import XCTest
@testable import UnitTestsProject

class SettingsViewTests: TestCaseBase {

    /// Settings view controller
    var settingsViewController: SettingsViewController!
    
    /// Setting's presenter mock
    var settingsPresenterMock: SettingsPresenterMock!
    
    
    override func setUp() {
        
        settingsViewController = SettingsViewController()
        settingsPresenterMock = SettingsPresenterMock()
    }

    override func tearDown() {
        
        settingsViewController = nil
        settingsPresenterMock = nil
    }

    
    func testViewDidLoadWithNilTextField() {
        
        // Given

        // When
        settingsViewController.viewDidLoad()
        
        // Then
        XCTAssertNil(settingsViewController.mediaTypeTextField, "Media type text field was initialized")
        XCTAssertNoThrow(settingsViewController.mediaTypeTextField)
    }

    func testViewDidLoadWithNotNilTextField() {
        
        // Given
        let textField = UITextField()
        settingsViewController.mediaTypeTextField = textField
        
        // When
        settingsViewController.viewDidLoad()
        
        // Then
        XCTAssertNotNil(settingsViewController.mediaTypeTextField, "Media type text field was not initialized")
        XCTAssertNotNil(settingsViewController.mediaTypeTextField.inputView === UIPickerView.self, "Picker view was not attached to media type text field")
    }
    
    func testViewWillAppear() {
        
        // Given
        settingsViewController.settingsPresenter = settingsPresenterMock
        
        // When
        settingsViewController.viewWillAppear(true)
        
        // Then
        XCTAssertNotNil(settingsPresenterMock, "Settings Presenter Mock was not initialized")
        XCTAssertTrue(settingsPresenterMock?.setInitialStateCalled ?? false, "Media type text field was not initialized")
    }
    
    func testSetValues() {
        
        // Given
        let mediaType = MediaPickOptions.all.rawValue
        let softwareType = softwareTypes[0]
        let searchResultsCount = 2
        
        let textField = UITextField()
        let label = UILabel()
        let segmentedControl = UISegmentedControl()
        let slider = UISlider()
        
        settingsViewController.mediaTypePickOptions = Constants.getMediaTypeOptions()
        settingsViewController.mediaTypeTextField = textField
        settingsViewController.searchResultsCountLabel = label
        settingsViewController.softwareTypeSegmentedControl = segmentedControl
        settingsViewController.searchResultsSlider = slider
        
        // When
        settingsViewController.setValues(mediaType: mediaType, softwareType: softwareType, searchResultsCount: searchResultsCount)
        
        // Then
        XCTAssertEqual(settingsViewController.mediaTypeTextField.text, mediaType)
        XCTAssertEqual(settingsViewController.searchResultsCountLabel.text, String(describing: searchResultsCount))
    }
    
    func testSetValuesWithWrongMediaType() {
    
        // Given
        let mediaType = "test"
        let softwareType = softwareTypes[0]
        let searchResultsCount = 2
    
        let textField = UITextField()
        let label = UILabel()
        let segmentedControl = UISegmentedControl()
        let slider = UISlider()
    
        settingsViewController.mediaTypePickOptions = Constants.getMediaTypeOptions()
        settingsViewController.mediaTypeTextField = textField
        settingsViewController.searchResultsCountLabel = label
        settingsViewController.softwareTypeSegmentedControl = segmentedControl
        settingsViewController.searchResultsSlider = slider
    
        // When
        settingsViewController.setValues(mediaType: mediaType, softwareType: softwareType, searchResultsCount: searchResultsCount)
    
        // Then
        XCTAssertNotEqual(settingsViewController.mediaTypeTextField.text, mediaType)
        XCTAssertNil(settingsViewController.searchResultsCountLabel.text)
    }
    
    func testSetValuesWithWrongSearchResultsCount() {
        
        // Given
        let mediaType = "test"
        let softwareType = softwareTypes[0]
        let searchResultsCount = -2
        
        let textField = UITextField()
        let label = UILabel()
        let segmentedControl = UISegmentedControl()
        let slider = UISlider()
        
        settingsViewController.mediaTypePickOptions = Constants.getMediaTypeOptions()
        settingsViewController.mediaTypeTextField = textField
        settingsViewController.searchResultsCountLabel = label
        settingsViewController.softwareTypeSegmentedControl = segmentedControl
        settingsViewController.searchResultsSlider = slider
        
        // When
        settingsViewController.setValues(mediaType: mediaType, softwareType: softwareType, searchResultsCount: searchResultsCount)
        
        // Then
        XCTAssertNotEqual(settingsViewController.mediaTypeTextField.text, mediaType)
        XCTAssertNil(settingsViewController.searchResultsCountLabel.text)
    }
    
    func testSetValuesWithWrongSoftwareType() {
        
        // Given
        let mediaType = MediaPickOptions.all.rawValue
        let softwareType = "test"
        let searchResultsCount = -2
        
        let textField = UITextField()
        let label = UILabel()
        let segmentedControl = UISegmentedControl()
        let slider = UISlider()
        
        settingsViewController.mediaTypePickOptions = Constants.getMediaTypeOptions()
        settingsViewController.mediaTypeTextField = textField
        settingsViewController.searchResultsCountLabel = label
        settingsViewController.softwareTypeSegmentedControl = segmentedControl
        settingsViewController.searchResultsSlider = slider
        
        // When
        settingsViewController.setValues(mediaType: mediaType, softwareType: softwareType, searchResultsCount: searchResultsCount)
        
        // Then
        XCTAssertNotEqual(settingsViewController.mediaTypeTextField.text, mediaType)
        XCTAssertNil(settingsViewController.searchResultsCountLabel.text)
        XCTAssertNotEqual(searchResultsCount, settingsViewController.softwareTypeSegmentedControl.selectedSegmentIndex)
    }
    
    func testNumberOfComponentsInPickerView() {
        
        // Given
        let textField = UITextField()
        settingsViewController.mediaTypeTextField = textField
        
        // When
        settingsViewController.viewDidLoad()
        
        // Then
        XCTAssertNotNil(settingsViewController.mediaTypeTextField, "Media type text field was not initialized")
        XCTAssertNotNil(settingsViewController.mediaTypeTextField.inputView === UIPickerView.self, "Picker view was not attached to media type text field")
        XCTAssertEqual(settingsViewController.numberOfComponents(in: (settingsViewController.mediaTypeTextField?.inputView as! UIPickerView)), 1)
    }
    
    func testDoneClick() {
        
        // Given
        let textField = UITextField()
        settingsViewController.mediaTypeTextField = textField
        settingsViewController.settingsPresenter = settingsPresenterMock
        
        // When
        settingsViewController.doneClick()
        
        // Then
        XCTAssertTrue(settingsPresenterMock.setMediaTypeCalled)
    }
    
    func testCancelClick() {
        
        // Given
        let textField = UITextField()
        settingsViewController.mediaTypeTextField = textField
        settingsViewController.settingsPresenter = settingsPresenterMock
        
        // When
        
        // Then
        XCTAssertNoThrow(settingsViewController.cancelClick())
    }
}
