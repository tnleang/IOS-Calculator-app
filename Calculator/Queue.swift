//
//  Queue.swift
//  Calculator
//
//  Created by Titichot Nuntapramote on 12/8/18.
//  Copyright © 2018 Titichot Nuntapramote. All rights reserved.
//

import Foundation

struct Queue<T> {
    var list = [T]()
    
    init() {
    }
    
    mutating func enqueue (_ element : T) {
        list.append(element)
    }
    
    mutating func dequeue () -> T? {
        if !list.isEmpty {
            return list.removeFirst()
        } else {
            return nil
        }
    }
    
    func size () -> Int {
        return list.count
    }
    
    func peek () -> T? {
        return list[0]
    }
    
    func isEmpty () -> Bool {
        return list.isEmpty
    }
}
