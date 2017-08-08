//
//  TaskOne.swift
//  SessionTenExercises
//
//  Created by Frascella Claudio on 8/7/17.
//  Copyright © 2017 TeamDecano. All rights reserved.
//

import Foundation

func taskOne() {
    
    var input: String? = ""
    
    while input != "end" {
        print("\nEnter your full name (end to stop): ", terminator: "")
        input = readLine()
        var firstName = input ?? ""
        
        if firstName == "" {
            print("You must enter at least your first name!", terminator: "\n")
            continue
        } else if firstName != "end" {
            if let index = firstName.characters.index(of: " ") {
                firstName = firstName.substring(to: index)
            }
            print("Your first name is : \(firstName)")
        }
    }
}
