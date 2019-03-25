//
//  ViewController.swift
//  UnitTests
//
//  Created by Ильдар Залялов on 25/03/2019.
//  Copyright © 2019 Ильдар Залялов. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func calculate(x: Int, y: Int) -> Int {
        
        guard x > 5 else { return y }
        
        return x + y
    }
    
    func hasDecimalNumbers(_ string: String) -> Bool {
        return string.rangeOfCharacter(from: .decimalDigits) != nil
    }
}

