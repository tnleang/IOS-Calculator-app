//
//  Token.swift
//  Calculator
//
//  Created by Titichot Nuntapramote on 12/8/18.
//  Copyright © 2018 Titichot Nuntapramote. All rights reserved.
//

import Foundation

let NUMBER = 1
let OPERATOR = 2
let VARIABLE = 3
let RIGHT_PARENTHESIS = 4
let LEFT_PARENTHESIS = 5


class Token {
    
    init() {
        
    }
    
    func typeOf() -> Int {
        Swift.print("I should not be called")
        return 0
    }
    
    func getPreceden () -> Int {
        Swift.print("I should not be called")
        return 0
    }
    
    func getArg () -> Int {
        Swift.print("I should not be called")
        return 0
    }
    
    func getValue () -> String {
        Swift.print("I should not be called")
        return ""
    }
    
    func print () {
    }
}
