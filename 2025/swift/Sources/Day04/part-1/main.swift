import Foundation
import Lib


func solve(input: [String]) -> Int {
    var paperCanBeMoved = 0;
    var matrix = input.map{ $0.split(separator: "").map{String($0)} }
    let paperChars = Set(["x", "@"])
    
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
            
            
            if(totalFound < 4){
                matrix[rowIndex][colIndex] = "x"
                paperCanBeMoved += 1
            }
    
        }
    }
//    for row in matrix {
//        print (row)
//    }
    return paperCanBeMoved;
}

let inputs = getFileLines(day: "04", fileName: "p1")
runTests();

print("Running Solve");
printWithBorder("""
Advent Of Code: 2025 - Day 4 - Part 1
Solution: \(solve(input: inputs))
""", spaceAbove: false)
