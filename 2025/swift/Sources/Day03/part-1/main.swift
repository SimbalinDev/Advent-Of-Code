import Foundation
import Lib

func workoutJoltage(joltage: String) -> Int {
    var maxJoltage = 0;
    let batteries = joltage.split(separator: "")
    
    for (index, batteryA) in batteries.enumerated() {
        for newBatteryIndex in (index + 1)...(batteries.count) {
            if(newBatteryIndex >= batteries.count) {break}
            let batteryB = batteries[newBatteryIndex]
            let newJolatage = Int(batteryA + batteryB) ?? -1
            if newJolatage > maxJoltage {
                maxJoltage = newJolatage
            }
        }
    }
    
    return maxJoltage
}

func solve(input: [String]) -> Int {
    var totalJoltage = 0
    for joltage in input {
        totalJoltage += workoutJoltage(joltage: joltage)
    }
    return totalJoltage
}

let inputs = getFileLines(day: "03", fileName: "p1")
runTests();

print("Running Solve");
printWithBorder("""
Advent Of Code: 2025 - Day 3 - Part 1
Solution: \(solve(input: inputs))
""", spaceAbove: false)
