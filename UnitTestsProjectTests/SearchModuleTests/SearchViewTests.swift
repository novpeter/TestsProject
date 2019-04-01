//
//  SearchViewTests.swift
//  UnitTestsProjectTests
//
//  Created by Петр on 31/03/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import XCTest
import UIKit
@testable import UnitTestsProject

class SearchViewTests: XCTestCase {

    /// Settings view controller
    var searchViewController: SearchViewController!
    
    /// Setting's presenter mock
    var searchPresenter: SearchPresenterMock!
    
    
    override func setUp() {
        
        searchPresenter = SearchPresenterMock()
        searchViewController = SearchViewController()
        searchViewController.searchPresenter = searchPresenter
    }

    override func tearDown() {
        
        searchViewController = nil
        searchPresenter = nil
    }

    
    func testViewDidLoad() {
        
        // Given
        let searchController = UISearchController()
        let tableView = UITableView()

        searchViewController.tableView = tableView
        searchViewController.content = []
        searchViewController.searchController = searchController
        
        // When
        searchViewController.viewDidLoad()
        
        // Then
        XCTAssertEqual(searchViewController.tableView.tableHeaderView, searchViewController.searchController.searchBar)
    }

    func testShowWebsite() {
        
        // Given
        let url = URL(string: "https://yandex.ru")
        let searchController = UISearchController()
        let tableView = UITableView()
        
        searchViewController.tableView = tableView
        searchViewController.content = []
        searchViewController.searchController = searchController
        
        // When
        searchViewController.viewDidLoad()
        
        // Then
        XCTAssertNoThrow(searchViewController.showWebsite(with: url))
    }
    
    func testShowWebsiteWithWrongUrl() {
        
        // Given
        let url = URL(string: "Ildar postav' full points")
        let searchController = UISearchController()
        let tableView = UITableView()
        
        searchViewController.tableView = tableView
        searchViewController.content = []
        searchViewController.searchController = searchController
        
        // When
        searchViewController.viewDidLoad()
        
        // Then
        XCTAssertNoThrow(searchViewController.showWebsite(with: url))
    }
    
    func testUpdateSearchResults() {
        
        // Given
        let searchController = UISearchController()
        let tableView = UITableView()
        
        searchViewController.tableView = tableView
        searchViewController.content = []
        searchViewController.searchController = searchController
        
        // When
        searchViewController.updateSearchResults(for: searchController)
        
        // Then
        XCTAssertTrue(searchPresenter.searchCalled, "Search method was not called")
    }
    
    func testUpdateContentWithEmptyContent() {
        
        // Given
        let content: [ResponseResult] = []
        let searchController = UISearchController()
        let tableView = UITableView()
        
        searchViewController.tableView = tableView
        searchViewController.content = []
        searchViewController.searchController = searchController
        
        // When
        searchViewController.viewDidLoad()
        searchViewController.updateContent(with: content)
        
        // Then
        XCTAssertTrue(searchViewController.content.isEmpty)
    }
}
