//
//  LoginViewController.swift
//  UnitTests
//
//  Created by Ильдар Залялов on 25/03/2019.
//  Copyright © 2019 Ильдар Залялов. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, LoginViewInput {
    
    var output: LoginViewOutput!
    
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
    
    //MARK: - LoginViewInput
    
    func calculate(x: Int, y: Int) -> Int {
        
        guard x > 5 else { return y }
        
        return x + y
    }
    
    func hasDecimalNumbers(_ string: String) -> Bool {
        return string.rangeOfCharacter(from: .decimalDigits) != nil
    }
    
    func calculate(x: Int, y: Int, completion: @escaping ((Int)->Void)) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) { [weak self] in
            
            guard let result = self?.calculate(x: x, y: y) else { completion(0); return }
            completion(result)
        }
    }
    
    @IBAction func buttonDidPressed(_ sender: UIButton) {
        
        sender.backgroundColor = UIColor.red
    }
}
