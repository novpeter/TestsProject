//
//  SearchModuleConfigurator.swift
//  UnitTestsProject
//
//  Created by Петр on 27/03/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation
import UIKit

class SearchModuleConfigurator: NSObject {
    
    @IBOutlet weak var viewController: UIViewController!
    
    override func awakeFromNib() {
        
        configureModule()
    }
    
    private func configureModule() {
        
        guard let view = viewController as? SearchViewController else { fatalError() }
        
        let presenter = SearchPresenter()
        let databaseManager = DatabaseManager()
        let networkManager = NetworkManager()
        
        view.searchPresenter = presenter
        view.content = []
        view.searchController = UISearchController(searchResultsController: nil)
        
        presenter.databaseManager = databaseManager
        presenter.networkManager = networkManager
        presenter.view = view
        presenter.decoder = JSONDecoder()
        
    }
}
