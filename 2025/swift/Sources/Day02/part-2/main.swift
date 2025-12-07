import Foundation
import Lib

// This worked but was super slow!
// Ran out of time for part 2 but the seemed like the simplest solution consdiering
// it was only a super small tweek from the working regex solution of part 1
// could possibly improve speed by implement map checking? not sure.
func findInvalidProductIDs(range: [Int]) -> Int {
    if range.count > 2 { return 0 }
    
    let start = range[0];
    let end = range[1];
    
    if start == 0 || end == 0 {
        return 0;
    }
    
    let invalidPattern = Regex(/^([0-9]+)\1+$/)
    var sum = 0
    
    for i in start...end {
        let numString = String(i);
        if numString[numString.startIndex] == "0" { continue }
        let isInvalid = numString.firstMatch(of: invalidPattern) != nil
        if isInvalid {
            sum += i
        }
    }
    
    return sum;
}


func solve(ids: String) -> Int {
    let idRanges = ids.split(separator: ",").map({ String($0).split(separator: "-").map({ Int($0) ?? 0 }) })
    var sumOfInvalidIds = 0
    for idRange in idRanges {
        sumOfInvalidIds += findInvalidProductIDs(range: idRange)
    }
    return sumOfInvalidIds
}

let inputs = getFileContent(day: "02", fileName: "p2")

runTests();

print("Running Solve");
printWithBorder("""
Advent Of Code: 2025 - Day 2 - Part 2
Solution: \(solve(ids: inputs.trimmingCharacters(in: .whitespacesAndNewlines)))
""", spaceAbove: false)
