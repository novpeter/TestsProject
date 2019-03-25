//
//  LoginModuleConfigurator.swift
//  UnitTests
//
//  Created by Ильдар Залялов on 25/03/2019.
//  Copyright © 2019 Ильдар Залялов. All rights reserved.
//

import Foundation
import UIKit

class LoginModuleConfigurator: NSObject {
    
    @IBOutlet weak var viewController: UIViewController!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureModule()
    }
    
    func configureModule() {
        
        let viewController = self.viewController as! LoginViewController
        let presenter = LoginPresenter()
        
        viewController.output = presenter
        presenter.view = viewController
    }
}
