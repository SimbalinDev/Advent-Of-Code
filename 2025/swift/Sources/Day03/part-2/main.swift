import Foundation
import Lib

// I REALLY don't deserve credit for the below. I had to look up a hint
// Hint: Monotonic Stack
// I than had to really sit down and learn about it this, I've never heard of that before
// I had Claude exaplin it to me, and then I did my best implenation in swift (lanuage I'm still litterally brand new in)
// although I got the right answer - this hurt my brain and I don't think I deserve a gold star on AOC
func workoutJoltage(joltage: String, numOfBatteries: Int) -> Int {
    let batteries = joltage.split(separator: "")
    var stack: [Int] = []
    var skips = joltage.count - numOfBatteries;
    
    if batteries.count < numOfBatteries {
        return -1;
    }
    
    for battery in batteries {
        let bat = Int(battery) ?? -1
        
        while !stack.isEmpty && (stack.last ?? -1) < bat && skips > 0 {
            stack.removeLast()
            skips -= 1
        }
                
        stack.append(bat)
        
    }
    
    return Int(stack.prefix(numOfBatteries).map{String($0)}.joined(separator: "")) ?? -1;
}

// Have to make sure to use 64bit int as 32bit would overflow if code run on a 32 bit machine
func solve(input: [String]) -> Int64 {
    var totalJoltage: Int64 = 0
    for joltage in input {
        totalJoltage += Int64(workoutJoltage(joltage: joltage, numOfBatteries: 12))
    }
    return totalJoltage
}

let inputs = getFileLines(day: "03", fileName: "p2")
runTests();

print("Running Solve");
printWithBorder("""
Advent Of Code: 2025 - Day 3 - Part 2
Solution: \(solve(input: inputs))
""", spaceAbove: false)
