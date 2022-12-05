//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    private var isFinishedTypingNumber = true
    private var calculator = CalculatorLogic()
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Error converting displayLabel.text to Double")
            }
            return number
        }
        set {
            var stringNewValue = String(newValue)
            
            if stringNewValue.hasSuffix(".0") {
                stringNewValue = stringNewValue.replacingOccurrences(of: ".0", with: "")
            }
            
            displayLabel.text = stringNewValue
        }
    }
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishedTypingNumber = true
        
        calculator.setNumber(displayValue)

        if let calcMethod = sender.currentTitle {
            
            guard let result = calculator.calculate(symbol: calcMethod) else {
                fatalError("the result of calculate is nil")
            }
            displayValue = result
        }
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        if let numValue = sender.currentTitle {
            if isFinishedTypingNumber {
                displayLabel.text! = numValue
                isFinishedTypingNumber = false
            } else {
                if numValue == K.Numbers.point {

                    if floor(displayValue) != displayValue {
                        return
                    }
                }

                displayLabel.text! += numValue
            }
        }
    }
}

