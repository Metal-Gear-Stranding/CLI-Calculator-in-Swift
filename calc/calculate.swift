//
//  calculate.swift
//  calc
//
//  Created by Alan Li on 29/3/19.
//  Copyright © 2019 UTS. All rights reserved.
//

import Foundation

class calculate {                                                           //calculate() is used to perform a calculation pass for each integer pair
    
    var firstInt: Int             //First number to be used in calculation pass
    var op: String                //Operator to be used in calculation pass
    var secondInt: Int            //Second number to be used in calculation pass
    var startPosition = 0     //StartPosition is used to determine which integer pair is calculated in the pass
    
    init(args: [String]) {        //initialise values to array positions, with 'if let' protection for unwrapping optionals
        
        if let unwrappedFirstInt = Int(args[startPosition]) {
            firstInt = unwrappedFirstInt
        } else {
            ExceptionHandling(errInput: args.joined(separator: " ")).invalidInput()
            exit(1)
        }
        op = args[startPosition+1]
        if let unwrappedSecondInt = Int(args[startPosition+2]) {
            secondInt = unwrappedSecondInt
        } else {
            ExceptionHandling(errInput: args.joined(separator: " ")).invalidInput()
            exit(1)
        }
        if !priorityOperator() {
            findCalculationPair(args: args)         //find the right number, operator, number set if op is not priority operator
        }
    }
    
    func findCalculationPair(args: [String]) {   //find the first pair of integers with a priority operator
        while startPosition < args.count-3 && !priorityOperator() {
            startPosition+=2
            firstInt = Int(args[startPosition])!
            op = args[startPosition+1]
            secondInt = Int(args[startPosition+2])!
        }
        if startPosition == args.count-3 && !priorityOperator() {  //use the first set in the array if none is found
            startPosition = 0
            firstInt = Int(args[0])!    //firstInt and secondInt are previously unwrapped with 'if let' during initialisation
            op = args[1]
            secondInt = Int(args[2])!
        }
    }
    
    //Operators are maintained with the two following functions:
    
    func calculate() -> (value: Int?, position: Int) {     //outputs calculation for args from a single pair of numbers from the args array
        var result: Int                                    //returns calculation output and position of result
        
        if (op == "/" || op == "%") && secondInt == 0 {    //checks for divide operator or modulus division by zero
            ExceptionHandling(errInput: "").divByZero()
        }
        
        switch op {
        case "+":
            result = firstInt + secondInt
        case "-":
            result = firstInt - secondInt
        case "x":
            result = firstInt * secondInt
        case "/":
            result = firstInt / secondInt
        case "%":
            result = firstInt % secondInt
        default:
            result = 0
            ExceptionHandling(errInput: op).unknownOperator()   //unknown operator exception handler
        }
        Validate(args: ["\(result)"]).isOutOfBounds()           //out of integer bounds exception handler
        return (result, startPosition)
    }
    
    func priorityOperator() -> Bool {                           //order of precedence function for operators
        switch op {
        case "+", "-":
            return false
        case "x", "/", "%":
            return true
        default:
            return false
        }
    }
}
