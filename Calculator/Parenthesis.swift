//
//  Parenthesis.swift
//  Calculator
//
//  Created by Titichot Nuntapramote on 12/9/18.
//  Copyright © 2018 Titichot Nuntapramote. All rights reserved.
//

import Foundation

class RightParenthesis : Token {
    var value : String
    
    init(op: String) {
        value = op
        super.init()
    }
    
    override func typeOf() -> Int {
        return RIGHT_PARENTHESIS
    }
    
}

class LeftParenthesis : Token {
    var value : String
    
    init(op: String) {
        value = op
        super.init()
    }
    
    override func typeOf() -> Int {
        return LEFT_PARENTHESIS
    }
    
    override func getPreceden () -> Int {
        return 0
    }
}
