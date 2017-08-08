//
//  main.swift
//  SessionTenExercises
//
//  Created by Frascella Claudio on 8/7/17.
//  Copyright © 2017 TeamDecano. All rights reserved.
//

import Foundation

func selectTask() {
    var input: String? = ""
    
    while input == "" {
        print("Choose task number (1/2/3/4): ", terminator: "")
        input = readLine()
        
        let choice: String = input ?? ""
        
        switch choice {
        case "1":
            taskOne()
        case "2":
            taskTwo()
        case "3":
            taskThree()
        case "4":
            taskFour()
        default:
            input = ""
            continue
        }
    }
    
}

selectTask()
