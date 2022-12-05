//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Yuriy Gudimov on 04.12.2022.
//  Copyright © 2022 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    private var number: Double?
    private var intermidiateCalculation: (n1: Double, calcMethod: String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double? {
        
        guard let n = number else { return nil }
        switch symbol {
        case K.Methods.ac: return 0
        case K.Methods.invert: return n * -1
        case K.Methods.percentage: return n / 100
        case K.Methods.equals:
            guard let storedNumber = intermidiateCalculation else { return 0 }
            return performTwoNumbersCalc(savedNumber: storedNumber, n2: n)
        default:
            intermidiateCalculation = (n1: n, calcMethod: symbol)
            return n
        }
    }
    
    private mutating func performTwoNumbersCalc(savedNumber: (n1: Double, calcMethod: String), n2: Double) -> Double {
        let n1 = savedNumber.n1
        
        intermidiateCalculation = nil // need to prevent multiple equal operations
        
        switch savedNumber.calcMethod {
        case K.Methods.sum: return n1 + n2
        case K.Methods.substrack: return n1 - n2
        case K.Methods.multiply: return n1 * n2
        case K.Methods.devide: return n1 / n2
        default: fatalError("wrong calc method detected")
        }
    }
}
