//
//  SearchViewInput.swift
//  UnitTestsProject
//
//  Created by Петр on 27/03/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation

protocol SearchViewInput: AnyObject {
    
    /// Updates table with given models
    ///
    /// - Parameter models: response models
    func updateContent(with models: [ResponseResult])
}
