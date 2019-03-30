//
//  AllResponse.swift
//  UnitTestsProject
//
//  Created by Петр on 30/03/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation

class ResponseModel: Codable {
    
    var resultCount: Int?
    var results: [ResponseResult]?
}

class ResponseResult: Codable {
    
    var kind: String?
    var artistName: String?
    var trackName: String?
    var trackViewUrl: String?
    var artworkUrl60: String?
    var shortDescription: String?
    var currency: String?
    var trackPrice: Double?
}
