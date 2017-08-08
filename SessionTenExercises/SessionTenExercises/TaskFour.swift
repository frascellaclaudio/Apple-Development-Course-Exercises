//
//  TaskFour.swift
//  SessionTenExercises
//
//  Created by Frascella Claudio on 8/7/17.
//  Copyright © 2017 TeamDecano. All rights reserved.
//

import Foundation

func taskFour() {
    var input: String? = ""
    
    while input == "" {
        print("Enter a string: ", terminator: "")
        input = readLine()
    }
    
    let testString = input ?? ""
    var aCount = 0, eCount = 0, iCount = 0, oCount = 0, uCount = 0
    
    for char in testString.characters {
        switch char {
        case "a": aCount += 1
        case "e": eCount += 1
        case "i": iCount += 1
        case "o": oCount += 1
        case "u": uCount += 1
        default:
            break
        }
    }
    
    print("Number of a's: \(aCount)")
    print("Number of e's: \(eCount)")
    print("Number of i's: \(iCount)")
    print("Number of o's: \(oCount)")
    print("Number of u's: \(uCount)")
}
