import Foundation
import Lib

//let inputs = getFileLines(day: "01", fileName: "p2-example")
let inputs = getFileLines(day: "01", fileName: "p2")

runTests();
printWithBorder("""
Advent Of Code: 2025 - Day 1 - Part 2
Solution: \(solve(inputs: inputs))
""", spaceAbove: false)
