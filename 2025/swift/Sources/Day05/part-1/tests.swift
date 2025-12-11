import Lib

struct Test {
    var data: [String];
    var exspected: Int;
}

// Exspected Format: [(Input, Output)]
let testCases: [Test] = [
    Test(data: ["3-5", "10-14", "16-20", "12-18", "1", "5", "8", "11", "17", "32"], exspected: 3)
]

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
