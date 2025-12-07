import Foundation
import Lib

// This worked but was super slow!
func findInvalidProductIDsAttempt1(range: String) -> Int {
    let splitRange = range.split(separator: "-")
    if splitRange.count > 2 { return 0 }
    
    let startInt = Int(splitRange[0]) ?? 0
    let endInt = Int(splitRange[1]) ?? 0
    
    if startInt == 0 || endInt == 0 {
        return 0;
    }
    let invalidPattern = Regex(/^([0-9]+)\1$/)
    var sum = 0
    
    for i in startInt...endInt {
        let numString = String(i);
        if numString[numString.startIndex] == "0" { continue }
        let isInvalid = numString.firstMatch(of: invalidPattern) != nil
        if isInvalid {
            sum += i
        }
    }
    
    return sum;
}

//Attempt 2 - Got solution 22582037050 again.
func findInvalidProductIDs(range: String) -> Int {
    let splitRange = range.split(separator: "-")
    if splitRange.count > 2 { return 0 }
    
    let startInt = Int(splitRange[0]) ?? 0
    let endInt = Int(splitRange[1]) ?? 0
    
    if startInt == 0 || endInt == 0 {
        return 0;
    }

    var sum = 0
    
    for i in startInt...endInt {
        let numString = String(i);
        if numString[numString.startIndex] == "0" || numString.count % 2 != 0 { continue }
        let halfway = numString.count / 2
        let firstHalf = numString[...numString.index(numString.startIndex, offsetBy: halfway - 1)]
        let secondHalf = numString[numString.index(numString.startIndex, offsetBy: halfway)...]
        if firstHalf == secondHalf { sum += i }
    }
    return sum;
}

func solve(ids: String) -> Int {
    let idRanges = ids.split(separator: ",")
    var sumOfInvalidIds = 0
    for idRange in idRanges {
        sumOfInvalidIds += findInvalidProductIDs(range: String(idRange))
    }
    return sumOfInvalidIds
}

let inputs = getFileContent(day: "02", fileName: "p1")

runTests();

print("Running Solve");
printWithBorder("""
Advent Of Code: 2025 - Day 2 - Part 1
Solution: \(solve(ids: inputs.trimmingCharacters(in: .whitespacesAndNewlines)))
""", spaceAbove: false)
