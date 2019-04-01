//
//  SettingsModuleConfigurator.swift
//  UnitTestsProject
//
//  Created by Петр on 27/03/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation
import UIKit

class SettingsModuleConfigurator: NSObject {
    
    @IBOutlet weak var viewController: UIViewController!
    
    override func awakeFromNib() {
        
        configureModule()
    }
    
    private func configureModule() {
        
        guard let view = viewController as? SettingsViewController else { fatalError() }
        
        let settingsPresenter = SettingsPresenter()
        let databaseManager = DatabaseManager()
        
        view.settingsPresenter = settingsPresenter
        view.mediaTypePickOptions = Constants.getMediaTypeOptions()
        settingsPresenter.view = view
        settingsPresenter.databaseManager = databaseManager
        
        if let currentSettings = databaseManager.getObjects(with: SettingsModel.self)?.first {
            
            settingsPresenter.currentSettings = currentSettings
        }
        else {
            let settings = SettingsModel()
            databaseManager.saveObjects(objects: [settings])
            settingsPresenter.currentSettings = settings
        }
        
    }
}
