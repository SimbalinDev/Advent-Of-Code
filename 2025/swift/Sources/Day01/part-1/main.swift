import Foundation
import Lib

let inputs = getFileLines(day: "01", fileName: "p1")

printWithBorder("""
Advent Of Code: 2025 - Day 1 - Part 1
Solution: \(solve(inputs: inputs))
""")
