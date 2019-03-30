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

enum MediaPickOptions: String {
    case all
    case movie
    case software
    case music
}

let softwareTypes: [String] = ["software", "iPadSoftware"]

class Constants {
    
    static func getOptions() -> [String] {
        return [
            MediaPickOptions.all.rawValue,
            MediaPickOptions.movie.rawValue,
            MediaPickOptions.software.rawValue,
            MediaPickOptions.music.rawValue
        ]
    }
}

