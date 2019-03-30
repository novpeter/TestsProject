//
//  NetworkManager.swift
//  UnitTestsProject
//
//  Created by Петр on 27/03/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation
import UIKit

class NetworkManager: NetworkManagerProtocol {
    
    func obtainData(with url: URL, completionBlock: @escaping (DownloadResult) -> Void) {
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                completionBlock(.Error(error: error.localizedDescription))
            }
            else {
                completionBlock(.Success(data: data!))
            }
            }.resume()
    }
    
}
