//
//  calcModel.swift
//  calculatorApp
//
//  Created by Nurbek on 9/23/19.
//  Copyright © 2019 Nurbek. All rights reserved.
//

import Foundation
enum Operation {
    case constant(Double)
    case unaryOperation((Double)->Double)
    case binaryOperation((Double,Double)->Double)
    case equals
}
struct calculatorModel {
    var my_operation:Dictionary = [
        "π" : Operation.constant(Double.pi),
        "e" : Operation.constant(M_E),
        "√" : Operation.unaryOperation(sqrt)
//        "+" : Operation.binaryOperation(<#T##(Double, Double) -> Double#>),
//        "-" : Operation.binaryOperation(<#T##(Double, Double) -> Double#>),
//        "*" : Operation.binaryOperation(<#T##(Double, Double) -> Double#>),
//        "/" : Operation.binaryOperation(<#T##(Double, Double) -> Double#>)
        
    ]
    private var global_Val:Double
    mutating func setOperand(_ operation:Double) {
        global_Val=operation
    }
    mutating func performOperation(_ operation:String){
        let symbol = my_operation[operation]!
        switch symbol {
        case .constant(let value):
            global_Val = value
        case .unaryOperation(let function):
            global_Val = function(global_Val)
        
        default:
            break
        }
    }
    
}
