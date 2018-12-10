//
//  Operator.swift
//  Calculator
//
//  Created by Titichot Nuntapramote on 12/8/18.
//  Copyright © 2018 Titichot Nuntapramote. All rights reserved.
//

import Foundation

class Operator : Token{
    var preceden : Int
    var arg : Int
    var value : String
    
    override init() {
        preceden = 0
        arg = 0
        value = ""
        super.init()
    }
    
    init( op : String) {
        switch op {
        case "+",
             "-":
            preceden = 1
            arg = 2
        case "*",
             "/":
            preceden = 2
            arg = 2
        case "^":
            preceden = 3
            arg = 2
        case "sin",
             "cos",
             "tan",
             "csc",
             "sec",
             "cot":
            preceden = 4
            arg = 1
        default:
            preceden = 0
            arg = 0
        }
        value = op
        super.init()
    }
    
    override func typeOf() -> Int {
        return OPERATOR
    }
    
    override func getPreceden () -> Int {
        return preceden
    }
    
    override func getArg () -> Int {
        return arg
    }
    
    override func getValue() -> String {
        return value
    }
}
