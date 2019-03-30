//
//  SearchPresenter.swift
//  UnitTestsProject
//
//  Created by Петр on 27/03/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation

class SearchPresenter: SearchViewOutput {
    
    /// Network manager
    var networkManager: NetworkManagerProtocol!
    
    /// Database manager
    var databaseManager: DatabaseManagerProtocol!
    
    /// Manager
    var view: SearchViewInput!
    
    /// Decoder
    var decoder: JSONDecoder!
    
    
    func search(for text: String?) {
        
        guard let text = text, let currentSettings = databaseManager.getObjects(with: SettingsModel.self)?.first else { return }
        
        let searchTextForRequest = text.replacingOccurrences(of: " ", with: "+", options: .literal, range: nil)
        var softwareTypeOptions = ""
        
        if currentSettings.mediaType == MediaPickOptions.software.rawValue {
            softwareTypeOptions = "\(currentSettings.mediaType)&entity=\(currentSettings.softwareType)"
        }
        else {
            softwareTypeOptions = currentSettings.mediaType
        }
        
        let urlString = "https://itunes.apple.com/search?term=\(searchTextForRequest)&country=US&media=\(softwareTypeOptions)&limit=\(currentSettings.searchResultsCount)"
        
        if let url = URL(string: urlString) {
            
            networkManager.obtainData(with: url) {[weak self] (result) in
                switch result {
                case .Success(let data):
                    
                    if let response = try? self?.decoder.decode(ResponseModel.self, from: data) {
                        
                        guard let responseResults = response?.results else { return }
                        self?.view.updateContent(with: responseResults)
                    }
                case .Error(let error):
                    print(error.localizedCapitalized)
                }
            }
        }
        
    }
}
