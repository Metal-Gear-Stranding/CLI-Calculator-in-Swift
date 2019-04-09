//
//  updateArgs.swift
//  calc
//
//  Created by Alan Li on 31/3/19.
//  Copyright © 2019 UTS. All rights reserved.
//

import Foundation

struct UpdateArgs {
    
    let args: [String]
    let resultValue: Int?
    let resultPosition: Int
    
    func update() -> [String] {                                                        //return result and any args that have not been processed
        
        if resultPosition == 0 && args.count == 3 {                                    //returns final result value
            return  ["\(resultValue!)"]
            
        } else if resultPosition == 0 && args.count > 1 && args.count > 3 {            //Handles scenario if result is on the left of the args array
            return ["\(resultValue!)"]  + Array(args[resultPosition + 3...args.count - 1])
            
        } else if resultPosition > 0 && resultPosition < args.count-3  {               //Handles scenario if result is in the middle of further calculations
            return Array(args[0...resultPosition - 1]) + ["\(resultValue!)"] + Array(args[resultPosition + 3...args.count - 1])
            
        } else  {
            return Array(args[0...resultPosition - 1]) + ["\(resultValue!)"]            //Handles scenario if result is on the right of the args array, but is not the last calc pass
            
        }
    }
}
