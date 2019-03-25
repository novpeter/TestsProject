//___FILEHEADER___

import Foundation
import UIKit

class ___VARIABLE_productName___ModuleConfigurator: NSObject {
    
    @IBOutlet weak var viewController: UIViewController!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureModule()
    }
    
    func configureModule() {
        
        let viewController = self.viewController as! ___VARIABLE_productName___ViewController
        let presenter = ___VARIABLE_productName___Presenter()
        
        viewController.output = presenter
        presenter.view = viewController
    }
}
