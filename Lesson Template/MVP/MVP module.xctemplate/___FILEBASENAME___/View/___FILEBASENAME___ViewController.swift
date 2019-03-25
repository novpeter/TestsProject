//___FILEHEADER___

import UIKit

class ___VARIABLE_productName___ViewController: UIViewController, ___VARIABLE_productName___ViewInput {
    
    var output: ___VARIABLE_productName___ViewOutput!
    
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
    
    //MARK: - ___VARIABLE_productName___ViewInput
    
    
}
