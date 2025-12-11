import Foundation
import Lib


// Using this day to learn about structs
struct IDRange: Hashable {
    var start: Int;
    var end: Int;
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(start)
        hasher.combine(end)
    }
    
    func includes(number: Int) -> Bool {
        return number >= start && number <= end
    }
    
    func loop(_ callback: (_: Int) -> Void) {
        for i in start...end {
            callback(i)
        }
    }
    
    func numbersInRange(inclusive: Bool = true) -> Int {
        return (end - start - 1) + (inclusive ? 2 : 0)
    }
}

// This was attempt 1, it was cool to learn about how I could make a callback function with struct
// but this hung on my machine and used 100% of CPU. I'm going to move on, I think the number in the example
// are simply too big to be looping through each of them, I'm going to need another way.
func solve1stAttempt(input: [String]) -> Int {
    var freshIngredients = Set<Int>()
    
    for range in input {
        if range.firstIndex(of: "-") == nil {
            continue
        }
        
        let newRange = range.split(separator: "-")
        let r = IDRange(start: Int(newRange[0]) ?? -1, end: Int(newRange[1]) ?? -1)
        
        r.loop{ freshIngredients.insert($0) }

    }
    
    return freshIngredients.count
}


// Note: this was absolute nightmare, needed hint and some help to figure out the logic in how to merge expand the ranges
// although I figured that's what I needed to do on my own actually working out how to do this in swift was a challenge.
// Once I finally got it working, I've done my best to explain the logic as clearly as I can't to prove I understand
// what my code is doing and I didn't just get lucky
func solve(input: [String]) -> Int {
    var IDRanges: [IDRange] = []
    
    for range in input {
        if range.firstIndex(of: "-") == nil { continue }
        
        let newRange = range.split(separator: "-")
        IDRanges.append(IDRange(start: Int(newRange[0]) ?? -1, end: Int(newRange[1]) ?? -1))

    }
    
//    Sort all the ranges based on the starting point
    let sortedIdRanges = IDRanges.sorted{ $0.start < $1.start }
    
//    Grab the first one (lowest starting point) if not bail.
    guard var currentExpanding: IDRange = sortedIdRanges.first else {
        return -1
    }
    
//    Create a new array to store all the merged ranges
    var mergedRanges: [IDRange] = []
    
//    Loop through the sorted ranges skipping the first one as we've already grabed it as expanding above
    for index in 1..<sortedIdRanges.count {
        let current = sortedIdRanges[index]
        
//        check the the current range (ahead of expanding) start is less than our expanding end
        if current.start <= currentExpanding.end {
//            If it's less than out exapnding end we need to adjust our expanding to include the current end
            currentExpanding.end = max(currentExpanding.end, current.end)
        } else {
//            if not, we're finished with this range and add add it to our finished merged ranges
            mergedRanges.append(currentExpanding)
//            We now to need to grab a new range to begin expanding and because the current start didn't fit in that range
//            We'll use this this one
            currentExpanding = current
        }
        
    }
//    Once finished going over all the ranges, add the last exanding range into the final array
    mergedRanges.append(currentExpanding)
    
    
    return mergedRanges.reduce(0, { $0 + $1.numbersInRange() })
}


let inputs = getFileLines(day: "05", fileName: "p2")

if runTests() {
    print("Running Solve");
    printWithBorder("""
    Advent Of Code: 2025 - Day 5 - Part 2
    Solution: \(solve(input: inputs))
    """, spaceAbove: false)
}
