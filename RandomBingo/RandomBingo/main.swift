//
//  main.swift
//  RandomBingo
//
//  Created by 김승원 on 5/12/24.
//

import Foundation

var computerChoice = Int.random(in: 1...100)
var myChoice: Int = 0

while true {
    
    var userInput = readLine()
    
    if let input = userInput {
        if let number = Int(input) {
            myChoice = number
        }
    }
    
    if computerChoice > myChoice {
        print("up")
    } else if computerChoice < myChoice {
        print("down")
    } else {
        print("Bingo")
        break
    }
}
