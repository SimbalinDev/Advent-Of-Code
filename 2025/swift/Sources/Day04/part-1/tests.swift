import Lib

// Exspected Format: [(Input, Output)]
let testCases: [([String], Int)] = [
    (["..@@.@@@@.",
      "@@@.@.@.@@",
      "@@@@@.@.@@",
      "@.@@@@..@.",
      "@@.@@@@.@@",
      ".@@@@@@@.@",
      ".@.@.@.@@@",
      "@.@@@.@@@@",
      ".@@@@@@@@.",
      "@.@.@@@.@."], 13)
]

// Test runner
func runTests(_ specificIndex: Int = -1) {
    var passed = 0
    var failed = 0
    
    printWithBorder("Starting Tests")
    
    for (i, test) in testCases.enumerated() {
        if specificIndex == -1 || specificIndex == i {
            let (input, expectedOut) = test
            let output = solve(input: input)
            
            if output == expectedOut {
                passed += 1
                print("✅ Test \(i + 1) PASSED: Range: \(input) -- Output: \(output)")
            } else {
                failed += 1
                print("❌ Test \(i + 1) FAILED")
                print("   Input: \(input)")
                print("   Expected out: \(expectedOut)")
                print("   Got out:      \(output)")
            }
        }
    }
    
    printWithBorder("Results: \(passed) passed, \(failed) failed out of \(testCases.count)")
}
