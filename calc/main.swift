//
//  main.swift
//  calc
//
//  Created by Alan Li on 31/3/19.
//  Copyright © 2019 UTS. All rights reserved.
//

import Foundation
var args = ProcessInfo.processInfo.arguments        //Gather input arguments for processing
args.removeFirst()
Validate(args: args).checkForValidInput()           //Validate args

var result: (value: Int?, position: Int) = (0, 0)   //initialise empty calculation result

if args.count == 1 {                                //handle single arguments where optional unwrap has been checked with 'if let' during validate process
    print(Int(args[0])!)
}

if args.count > 2 {                                 //process calculation passes for valid arguments until result is achieved
    while args.count > 2 {
        (result.value, result.position) = calculate(args: args).calculate()
        args = UpdateArgs(args: args, resultValue: result.value, resultPosition: result.position).update()
    }
    print(result.value!)
}
