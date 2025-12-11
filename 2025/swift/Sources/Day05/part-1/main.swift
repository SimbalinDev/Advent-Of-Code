import Foundation
import Lib


// Using this day to learn about structs
struct IDRange {
    let start: Int;
    let end: Int;
    
    func includes(number: Int) -> Bool {
        return number >= start && number <= end
    }
}

func solve(input: [String]) -> Int {
    var ranges: [IDRange] = []
    var IDs: [Int] = []
    var freshIngredients = 0
    
    for range in input {
        if range.firstIndex(of: "-") != nil {
            let newRange = range.split(separator: "-")
            ranges.append(IDRange(start: Int(newRange[0]) ?? -1, end: Int(newRange[1]) ?? -1))
            continue
        }
        
        IDs.append(Int(range) ?? -1)
    }
    
    // Note to self: I think I should absolutely doing this in the loop above to avoid re-running loops
    // I don't know why my brain defaulted to sorting all the data regadless of order when I know the input
    // is always ranges, then IDS. This code generated the correct answer though so I'm moving on to p2.
    for ID in IDs {
        for range in ranges {
            if(range.includes(number: ID)) {
                freshIngredients += 1
                break
            }
        }
    }
    
    return freshIngredients
}

let inputs = getFileLines(day: "05", fileName: "p1")

if runTests() {
    print("Running Solve");
    printWithBorder("""
    Advent Of Code: 2025 - Day 5 - Part 1
    Solution: \(solve(input: inputs))
    """, spaceAbove: false)
}
