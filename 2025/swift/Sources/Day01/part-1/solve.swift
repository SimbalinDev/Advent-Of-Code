//
//  solve.swift
//  AdventOfCode2025
//
//  Created by Connor Gaunt on 01/12/2025.
//

func solve(inputs: [String]) -> Int {
    
    var dial = 50
    var timesHitZero = 0
    
    for input in inputs where !input.isEmpty {
        
        let amountIndex = input.index(input.startIndex, offsetBy: 1, limitedBy: input.endIndex) ?? input.endIndex
        let dir = String(input[input.startIndex..<amountIndex]).uppercased()
        let amountSlice = input[amountIndex...].trimmingCharacters(in: .whitespaces)
        guard let amount = Int(amountSlice) else { continue }
        
        if dir == "L" {
            dial -= amount
            while dial < 0 {
                dial += 100
            }
        }
        if dir == "R" {
            dial += amount
            while dial >= 100 {
                dial -= 100
            }
        }
        if dial == 0 {
            timesHitZero += 1;
        }
    }

    return timesHitZero
}
