//
//  TaskTwo.swift
//  SessionTenExercises
//
//  Created by Frascella Claudio on 8/7/17.
//  Copyright © 2017 TeamDecano. All rights reserved.
//

import Foundation

func taskTwo() {
    
    let phrase = "These are some exercises for you to practice all the methods from the string class"
    var input: String? = ""
    
    while input == "" {
        print("Enter a letter: ", terminator: "")
        input = readLine()
    }
    
    let inputChar = input ?? ""
    let count = phrase.components(separatedBy: inputChar).count - 1
    
    print("Letter \(inputChar) was found \(count) times")
}
