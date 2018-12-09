//
//  Number.swift
//  Calculator
//
//  Created by Titichot Nuntapramote on 12/8/18.
//  Copyright © 2018 Titichot Nuntapramote. All rights reserved.
//

import Foundation

class Number : Token {
    var value : Double
    
    override init() {
        value = 0.0
        super.init()
    }
    
    init( token : String) {
        if let number = Double(token){
            value = number
            super.init()
        } else {
            value = 0.0
            super.init()
        }
    }
    
    func getValue () -> Double {
        return value
    }
    
    override func typeOf() -> Int {
        return NUMBER
    }
    
    override func print () {
        Swift.print(value)
    }
}
