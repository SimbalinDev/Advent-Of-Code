import Lib

struct Test {
    var data: Int;
    var exspected: Int;
}

// Exspected Format: [(Input, Output)]
let testCases: [Test] = []

// Test runner
func runTests(_ specificIndex: Int = -1) -> Bool {
    var passed = 0
    var failed = 0
    
    printWithBorder("Starting Tests")
    
    for (i, test) in testCases.enumerated() {
        if specificIndex == -1 || specificIndex == i {
            let testResult = test
            let output = solve(input: testResult.data)
            
            if output == testResult.exspected {
                passed += 1
                print("✅ Test \(i + 1) PASSED: Range: \(testResult.data) -- Output: \(testResult.exspected)")
            } else {
                failed += 1
                print("❌ Test \(i + 1) FAILED")
                print("   Input: \(testResult.data)")
                print("   Expected out: \(testResult.exspected)")
                print("   Got out:      \(output)")
            }
        }
    }
    
    printWithBorder("Results: \(passed) passed, \(failed) failed out of \(testCases.count)")
    
    return failed == 0
}
