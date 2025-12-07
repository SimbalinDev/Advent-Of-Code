//
//  solve.swift
//  AdventOfCode2025
//
//  Created by Connor Gaunt on 01/12/2025.
//  Correct Answer From: 6496

// I REALLY don't want to do this - but need to submit a correct answer. There must be a much simplier solution than this. This is awful
// Got the Correct answer with the code below.
func bruteForeMove(startingPosition: Int, moveAmount:Int, debug: Bool = false) -> (newPos: Int, timesHitZero: Int){
    if moveAmount == 0 && startingPosition == 0 {
        return (startingPosition, 1);
    }
    var currentPos = startingPosition;
    var hitAmount = 0;
    
    if debug { print("============================") }
    if debug { print("Starting at: \(startingPosition)") }
    if moveAmount > 0 {
        for _ in 1...moveAmount {
            currentPos += 1;
            if(currentPos == 100){
                hitAmount += 1
                currentPos = 0
                if debug { print("We Hit Zero!!!!") }
            } else {
                if debug { print("Moving To: \(currentPos)") }
            }
        }
    } else {
        for _ in 1...abs(moveAmount) {
            currentPos -= 1;
            if(currentPos == 0) {
                hitAmount += 1
                if debug { print("We Hit Zero!!!!")}
            }
            else if(currentPos < 0){
                currentPos = 99
                if debug { print("Moving To: \(currentPos)") }
            } else {
                if debug { print("Moving To: \(currentPos)") }
            }
            
        }
    }
    
    if debug {
        print("============================")
        print("Ended At: \(currentPos)")
    }
    
    return (currentPos, hitAmount)
}


// Final implementaion ofmoving the dial without brute forcing every number
func moveDial(startingPosition: Int, moveAmount: Int, debug: Bool = false) -> (newPos: Int, timesHitZero: Int) {
    if debug {
        print("=================================")
        print("Starting Pos: \(startingPosition) - moving: \(moveAmount)")
        
    }
    
    if moveAmount == 0 {
        return (startingPosition, 0)
    }
    
    var timesHitZero = 0;
    var currentPos = startingPosition
    
    currentPos += moveAmount
    
    if moveAmount < 0 && currentPos <= 0{
        timesHitZero += abs(currentPos / 100) + (startingPosition != 0 ? 1 : 0)
        let remainder = currentPos % 100
        currentPos = remainder == 0 ? remainder : 100 - abs(remainder)
    } else if currentPos > 99 {
        timesHitZero += (currentPos / 100)
        currentPos = currentPos % 100
    }
    
    if debug{
        print("Ending Pos: \(currentPos) - Past Zero \(timesHitZero) times")
    }
    
    return (currentPos, timesHitZero)
}


func solve(inputs: [String]) -> Int {
    
    var dialPosition = 50
    var timesHitZero = 0
    
    for input in inputs where !input.isEmpty {
        
        let amountIndex = input.index(input.startIndex, offsetBy: 1, limitedBy: input.endIndex) ?? input.endIndex
        let dir = String(input[input.startIndex..<amountIndex]).uppercased()
        let amountSlice = input[amountIndex...].trimmingCharacters(in: .whitespaces)
        guard let amount = Int(amountSlice) else { continue }

        let moveAmount = dir == "R" ?  amount : -amount
            
        let (newDialPosition, timesHit) = moveDial(startingPosition: dialPosition, moveAmount: moveAmount);
        if(timesHit > 0) { timesHitZero += timesHit }
        dialPosition = newDialPosition
    }

    return timesHitZero
}
