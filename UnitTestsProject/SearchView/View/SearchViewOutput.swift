//
//  SearchViewOutput.swift
//  UnitTestsProject
//
//  Created by Петр on 27/03/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation

protocol SearchViewOutput: AnyObject {
    
    func search(for text: String?)
}
