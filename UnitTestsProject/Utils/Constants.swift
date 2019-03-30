//
//  Constants.swift
//  UnitTestsProject
//
//  Created by Петр on 28/03/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation

enum Identifires: String {
    case cell
}

enum PickOptions: String {
    case all
    case movie
    case software
    case music
}

let softwareTypes: [String] = ["software", "iPadSoftware"]

class Constants {
    
    static func getOptions() -> [String] {
        return [
            PickOptions.all.rawValue,
            PickOptions.movie.rawValue,
            PickOptions.software.rawValue,
            PickOptions.music.rawValue
        ]
    }
}

