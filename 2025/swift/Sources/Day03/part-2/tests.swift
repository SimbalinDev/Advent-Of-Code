import Lib

let testCases: [([String], Int)] = [
    (["987654321111111"], 987654321111),
    (["811111111111119"], 811111111119),
    (["234234234234278"], 434234234278),
    (["818181911112111"], 888911112111),
    (["987654321111111",
      "811111111111119",
      "234234234234278",
      "818181911112111"], 3121910778619)
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
