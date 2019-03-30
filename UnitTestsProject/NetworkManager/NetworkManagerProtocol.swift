//
//  NetworkManagerProtocol.swift
//  UnitTestsProject
//
//  Created by Петр on 27/03/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation
import UIKit

enum DownloadResult {
    case Success(data: Data)
    case Error(error: String)
}

protocol NetworkManagerProtocol {
    
    /// Obtains image with given url
    ///
    /// - Parameters:
    ///   - url: url
    ///   - completionBlock: to return result
    func obtainData(with url: URL, completionBlock: @escaping (DownloadResult) -> Void)
}
