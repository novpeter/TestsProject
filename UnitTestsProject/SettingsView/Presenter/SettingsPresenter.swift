//
//  SettingsPresenter.swift
//  UnitTestsProject
//
//  Created by Петр on 27/03/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation

class SettingsPresenter: SettingsViewOutput {
    
    /// View
    var view: SettingsViewInput!
    
    /// Database manager
    var databaseManager: DatabaseManagerProtocol!
    
    /// Current settings
    var currentSettings: SettingsModel!
    

    
    
    func setMediaType(type: String?) {
        
        guard let type = type else { return }
        
        if Constants.getOptions().contains(type) {
            
            databaseManager.performTransaction {
                currentSettings.mediaType = type
            }
            setInitialState()
        }
    }
    
    func setSearchResultsCount(count: Int) {
        
        if count > 0 && count < 201 {
            
            databaseManager.performTransaction {
                currentSettings.searchResultsCount = count
            }
            
            setInitialState()
        }
    }
    
    func setSoftwareType(_ type: String) {
        
        guard softwareTypes.contains(type) else { return }
        
        databaseManager.performTransaction {
            currentSettings.softwareType = type
        }
        setInitialState()
    }
    
    func setInitialState() {
        view.setValues(mediaType: currentSettings.mediaType, softwareType: currentSettings.softwareType, searchResultsCount: currentSettings.searchResultsCount)
    }
}
