//
//  RPN.swift
//  Calculator
//
//  Created by Titichot Nuntapramote on 12/9/18.
//  Copyright © 2018 Titichot Nuntapramote. All rights reserved.
//

import Foundation


private func getAnswer (performance : inout Stack<Double>, op : Token) -> Double {
    var first = performance.pop()!
    
    switch op.getArg() {
        case 1:
            if op.getValue() == "sin" {
                return sin(first)
            } else if op.getValue() == "cos" {
                return cos(first)
            } else if op.getValue() == "tan" {
                return tan(first)
            } else if op.getValue() == "csc" {
                return 1/sin(first)
            }else if op.getValue() == "sec" {
                return 1/cos(first)
            }else if op.getValue() == "cot" {
                return 1/tan(first)
            }
        case 2:
            var second = performance.pop()!
            if op.getValue() == "+" {
                return second + first
            } else if op.getValue() == "-" {
                return second - first
            } else if op.getValue() == "x" {
                return second * first
            } else if op.getValue() == "/" {
                return second / first
            } else if op.getValue() == "^" {
                return pow(second, first)
            }
    default:
        print("(getAnser->switch)ERROR: the program should run to this segment of code")
    }
    print("(getAnser)ERROR: the program should run to this segment of code")
    return 0 //return to delete syntax error
}


/*
 *  while incoming queue is not empty
 *  if number   -> put into the stack
 *  if operator -> pop one number out from the stack
 *                  if the opearator requires to numbers -> pop another one
 *                 do the calculation, then put it back to stack
 *
 *  last, take the leftover number from the stack
 * */
func RPN (equation : Queue<Token>, variable : Double) -> Double {
    var posfix = equation
    var howMany = posfix.size() // how many times needed to do the action
    var performance = Stack<Double>()
    
    for count in 0...howMany {
        var using = posfix.dequeue()
        //pop it out
        //then check what it is
        switch using!.typeOf() {
        case NUMBER:
            performance.push(Double(using!.getValue())!)
            
            
        default:
            print("ERROR")
        }
    }
    var answer = performance.pop()!
    return answer
}
