//
//  Stack.swift
//  Calculator
//
//  Created by Titichot Nuntapramote on 12/8/18.
//  Copyright © 2018 Titichot Nuntapramote. All rights reserved.
//

import Foundation

struct Stack<T> {
    var list = [T]()
    
    init() {
    }
    
    mutating func push (_ element : T) {
        list.append(element)
    }
    
    mutating func pop () -> T? {
        if !list.isEmpty {
            return list.removeLast()
        } else {
            return nil
        }
    }
    
    func peek () -> T? {
        return list.last
    }
    
    func size () -> Int {
        return list.count
    }
    
    func isEmpty () -> Bool {
        return list.isEmpty
    }
}
