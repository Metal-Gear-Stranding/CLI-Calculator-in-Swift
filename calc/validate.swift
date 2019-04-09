//
//  validate.swift
//  calc
//
//  Created by Alan Li on 31/3/19.
//  Copyright © 2019 UTS. All rights reserved.
//

import Foundation

struct Validate {  //validate struct is used to validate calc inputs and results of each pass to identify any exceptions
    
    let args: [String]
    let index = 0
    
    func checkForValidInput() {                                         //checks if input arguments are valid
        if (args.count % 2 == 0) {                                      //checks for invalid argument count
            ExceptionHandling(errInput: "").incompleteExpression()
        }
        if (args.count == 1 && Int(args[0]) == nil)  {                  //checks for non-numerical single character inputs
            ExceptionHandling(errInput: args[index]).invalidInput()
        }
        for index in stride(from: 0, to: args.count-2, by: 2) {         //checks for non-integers and/or nil args in array positions that require numbers
            if Int(args[index]) == nil {
                ExceptionHandling(errInput: args[index]).invalidInput()
            }
        }
        isOutOfBounds()
    }
    
    func isOutOfBounds() {                                              //initial argument validation
        for index in stride(from: 0, to: args.count, by: 1) {           //check if calculation result is out of bounds
            if let integerSize = Int(args[index]) {
                if integerSize > Int32.max || integerSize < Int32.min {
                    ExceptionHandling(errInput: (args.joined(separator: " "))).integerOverflow()
                }
            }
        }
    }
}
