//
//  Tokenizer.swift
//  Calculator
//
//  Created by Titichot Nuntapramote on 12/8/18.
//  Copyright © 2018 Titichot Nuntapramote. All rights reserved.
//

import Foundation

/*
 * getline the whole equation
 * look at the string equation individually in each index
 *      if 'x'          -> put into queue
 *      if ( ) + - * /  -> put into queue
 *      if s c t        -> put into queue with 3 index
 *      if digit        -> put digit into temperary string and check the next one
 *                          until the next is not digit, then put the temperary string into queue as number
 *      if white space  -> ignore
 *
 * */
func tokenizing (equalation : String) -> Queue<Token> {
    var infix = Queue<Token>()
    var index = equalation.startIndex
    
    while index != equalation.endIndex {
        var temp : String = ""
        
            //case of operator +-x/
        if equalation[index] == "x" || equalation[index] == "+" || equalation[index] == "-" || equalation[index] == "/"{
            infix.enqueue(Operator(op: String(equalation[index])))
            index = equalation.index(after: index)
        }
            //case of number
        else if Double(String(equalation[index])) != nil {
            temp += String(equalation[index])
            index = equalation.index(after: index)
            while Double(String(equalation[index])) != nil {
                temp += String(equalation[index])
                index = equalation.index(after: index)
            }
            infix.enqueue(Number(num: temp))
        }
            //case of sin cos tan
        else if equalation[index] == "s" || equalation[index] == "c" || equalation[index] == "t" {
            //need fixing, have to change to subString function
            temp += String(equalation[index])
            index = equalation.index(after: index)
            temp += String(equalation[index])
            index = equalation.index(after: index)
            temp += String(equalation[index])
            index = equalation.index(after: index)
            
            infix.enqueue(Operator(op: temp))
            
        }
            //case of white space (will need it for users' typing input)
        else if equalation[index] == " " {
            index = equalation.index(after: index)
        }
        
        
    }
    
    return infix
}


/*
 *
 *  if number       -> put into output queue
 *
 *  if operator     -> while incoming one <= the one in stack
 *                     put the one in stack to output queue
 *                     put incoming one to stack if the condition is false
 *
 *  if left "("     -> put into stack
 *
 *  if right ")"    -> pop operator from stack and put into output queue
 *                     until it hit "("
 *
 *
 * */
func ShuntingYard (infix : inout Queue<Token>) -> Queue<Token> {
    var posfix = Queue<Token>()
    var op_stack = Stack<Token>()
    
    while !infix.isEmpty() {
        switch infix.peek()?.typeOf() {
            case NUMBER:
                posfix.enqueue(infix.dequeue()!)
            case OPERATOR:
                //if empty just push into the stack
                if op_stack.isEmpty() {
                    op_stack.push(infix.dequeue()!)
                } else{
                    //check the preceden
                    //if the new one has smaller or equal then
                    //let the old one go to the output queue first
                    while !op_stack.isEmpty() && infix.peek()!.getPreceden() <= op_stack.peek()!.getPreceden() {
                        posfix.enqueue(op_stack.pop()!)
                    }
                    op_stack.push(infix.dequeue()!)
                }
            case LEFT_PARENTHESIS:
                //if left paren then just put it into the stack
                op_stack.push(infix.dequeue()!)
            case RIGHT_PARENTHESIS:
                //if it is right paren
                //pop operator from the stack and put them into the output queue
                //until the pop one is left paren
                infix.dequeue()
                while op_stack.peek()?.typeOf() != LEFT_PARENTHESIS {
                    posfix.enqueue(op_stack.pop()!)
                }
                op_stack.pop()
            
            default:
                print("(ShuntingYard->switch)ERROR: the program should run to this segment of code")
        }
        
        // put the rest of operators into posfix
        while !op_stack.isEmpty() {
            posfix.enqueue(op_stack.pop()!)
        }
    }
    return posfix
}
