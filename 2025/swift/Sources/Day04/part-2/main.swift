import Foundation
import Lib


func removeRolls(matrix: [[String]]) -> ([[String]], Int){
    var tmpMatrix = matrix
    let paperChars = Set(["x", "@"])
    var paperCanBeMoved = 0;
    func checkRow(
        rowIndex: Int,
        colIndex: Int,
        maxCols: Int,
        checkMiddle: Bool = true
    ) -> Int {
        var found = 0
        if colIndex > 0 && paperChars.contains(matrix[rowIndex][colIndex - 1]) { found += 1 }
        if checkMiddle && paperChars.contains(matrix[rowIndex][colIndex]) { found += 1 }
        if colIndex < maxCols - 1 && paperChars.contains(matrix[rowIndex][colIndex + 1]) { found += 1 }
        return found
    }
    

    
    for (rowIndex, paperRows) in matrix.enumerated() {
        for (colIndex, char) in paperRows.enumerated() {
            if char == "." { continue }
            
            var totalFound = 0
            
            if rowIndex > 0 {
                totalFound += checkRow(
                    rowIndex: rowIndex - 1,
                    colIndex: colIndex,
                    maxCols: paperRows.count
                )
            }
            totalFound += checkRow(
                rowIndex: rowIndex,
                colIndex: colIndex,
                maxCols: paperRows.count,
                checkMiddle: false
            )
            if rowIndex < matrix.count - 1 {
                totalFound += checkRow(
                    rowIndex: rowIndex + 1,
                    colIndex: colIndex,
                    maxCols: paperRows.count
                )
            }
            
            
            if totalFound < 4 {
                tmpMatrix[rowIndex][colIndex] = "x"
                paperCanBeMoved += 1
            }
    
        }
    }
    
    let newMatrix = tmpMatrix.map{$0.map{ if $0 == "x" {return "."} else {return $0} }}
    
    return (newMatrix, paperCanBeMoved)
}

func solve(input: [String]) -> Int {
    var totalRemoved = 0
    var lastRemoved = 0
    var matrix = input.map{ $0.split(separator: "").map{String($0)} }

    repeat {
        let (newMatrix, rollsRemoved) = removeRolls(matrix: matrix)
        matrix = newMatrix
        totalRemoved += rollsRemoved
        lastRemoved = rollsRemoved
    } while lastRemoved > 0

    return totalRemoved;
}

let inputs = getFileLines(day: "04", fileName: "p2")
runTests();

print("Running Solve");
printWithBorder("""
Advent Of Code: 2025 - Day 4 - Part 2
Solution: \(solve(input: inputs))
""", spaceAbove: false)
