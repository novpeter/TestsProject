//
//  MapsViewController.swift
//  UnitTests
//
//  Created by Ильдар Залялов on 25/03/2019.
//  Copyright © 2019 Ильдар Залялов. All rights reserved.
//

import UIKit

class MapsViewController: UIViewController, MapsViewInput {
    
    var output: MapsViewOutput!
    
    //MARK: - Методы
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        output.setupInitialState()
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return .portrait
    }
    
    //MARK: - MapsViewInput
    
    
}
