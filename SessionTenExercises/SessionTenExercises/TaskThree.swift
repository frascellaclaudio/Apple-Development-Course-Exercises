//
//  TaskThree.swift
//  SessionTenExercises
//
//  Created by Frascella Claudio on 8/7/17.
//  Copyright © 2017 TeamDecano. All rights reserved.
//

import Foundation

func taskThree() {
    
    var input: String? = ""
    
    while input == "" {
        print("Enter a string: ", terminator: "")
        input = readLine()
    }
    
    let inputString = input ?? ""
    var vowelCount = 0

    for char in inputString.characters {
        switch char {
        case "a", "e", "i", "o", "u":
            vowelCount += 1
        default:
            break
        }
    }

    print("Total vowels: \(vowelCount)")
}
