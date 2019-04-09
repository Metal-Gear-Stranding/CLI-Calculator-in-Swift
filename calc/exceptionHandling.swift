//
//  exceptionHandling.swift
//  calc
//
//  Created by Alan Li on 31/3/19.
//  Copyright © 2019 UTS. All rights reserved.
//

import Foundation

struct ExceptionHandling {   //exception handling centralised for easy maintenance
    
    let errInput: String
    
    enum CalcError: Error {  //setting up error types
        case invalidInput
        case integerOverflow
        case divByZero
        case unknownOperator
        case incompleteExpression
    }
    
    // //functions for error handling
    func invalidInput() {
        do {
            throw CalcError.invalidInput
        } catch {
            print("Invalid number: \(errInput)")
            exit(1)
        }
    }
    
    func integerOverflow() {
        do {
            throw CalcError.integerOverflow
        } catch {
            print("Integer Overflow: \(errInput) > 9223372036854775807")
            exit(2)
        }
    }
    
    func divByZero() {
        do {
            throw CalcError.divByZero
        } catch {
            print("Division by zero")
            exit(3)
        }
    }
    
    func unknownOperator() {
        do {
            throw CalcError.unknownOperator
        } catch {
            print("Unknown operator: \(errInput)")
            exit(4)
        }
    }
    
    func incompleteExpression() {
        do {
            throw CalcError.incompleteExpression
        } catch {
            print("Incomplete expression. Expected input of the form [number] [operator number ...]")
            exit(5)
        }
    }
}

