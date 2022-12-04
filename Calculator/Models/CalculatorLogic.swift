//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Yuriy Gudimov on 04.12.2022.
//  Copyright © 2022 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    var number: Double
    
//    init(number: Double) {
//        self.number = number
//    }
//
    func calculate(symbol: String) -> Double? {
        
        switch symbol {
        case K.Methods.ac: return 0
        case K.Methods.invert: return number * -1
        case K.Methods.percentage: return number / 100
        default: return nil
        }
    }
}
