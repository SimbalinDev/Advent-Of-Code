import Lib
// NOTE: This file to runs tests bacause couldn't get swift testing working and didn't have time to look into properly. Ideally I'd love to refactor this into an actual unit test using swift Testing.

// NOTE: Once I figured out the correct answer I wanted to clean it up and kept hitting edge cases so I had AI generate some test data I can use to strengthen my implementation as although I had the correct answer and it was "working" I knew there would be bugs.


// Test format: (startPos, moveAmount, expectedEndPos, expectedZeroHits)
let testCases: [(Int, Int, Int, Int)] = [
    // Edge case: Starting at 0
    (0, -5, 95, 0),           // Test 1: Start at 0, move left (no wrap)
    (0, 5, 5, 0),             // Test 2: Start at 0, move right (no wrap)
    (0, 100, 0, 1),           // Test 3: Start at 0, move right full circle
    (0, -100, 0, 1),          // Test 4: Start at 0, move left full circle
    (0, 200, 0, 2),           // Test 5: Start at 0, double wrap right
    (0, -200, 0, 2),          // Test 6: Start at 0, double wrap left
    
    // Edge case: Landing on 0 with move of exactly 99
    (99, -99, 0, 1),          // Test 7: L99 from 99 should hit 0 once
    (1, 99, 0, 1),            // Test 8: R99 from 1 should hit 0 once
    
    // From problem examples
    (50, 1000, 50, 10),       // Test 9: R1000 from 50
    (50, -1000, 50, 10),      // Test 10: L1000 from 50
    
    // Single wrap cases
    (50, 50, 0, 1),           // Test 11: R50 from 50 hits 0 once
    (50, -50, 0, 1),          // Test 12: L50 from 50 hits 0 once
    (10, -20, 90, 1),         // Test 13: Wrap once going left
    (90, 20, 10, 1),          // Test 14: Wrap once going right
    
    // No wrap cases
    (10, 50, 60, 0),          // Test 15: No wrap, doesn't touch 0
    (50, -30, 20, 0),         // Test 16: No wrap, doesn't touch 0
    
    // Landing exactly on 0
    (5, -5, 0, 1),            // Test 17: Land on 0 going left
    (95, 5, 0, 1),            // Test 18: Land on 0 going right
    (1, -1, 0, 1),            // Test 19: One step to 0 going left
    (99, 1, 0, 1),            // Test 20: One step to 0 going right
    
    // Multiple wraps
    (25, 250, 75, 2),         // Test 21: 2.5 wraps right
    (75, -250, 25, 2),        // Test 22: 2.5 wraps left
    (33, 567, 0, 6),          // Test 23: Many wraps, land on 0
    (10, 390, 0, 4),          // Test 24: Multiple wraps right
    (10, -410, 0, 5),         // Test 25: Multiple wraps left
    
    // No movement
    (50, 0, 50, 0),           // Test 26: No movement
    (0, 0, 0, 0),             // Test 27: No movement from 0
    
    // Move less than position (no wrap)
    (75, 24, 99, 0),          // Test 28: R24 from 75
    (75, -24, 51, 0),         // Test 29: L24 from 75
]

// Test runner
func runTests() {
    var passed = 0
    var failed = 0
    
    printWithBorder("Starting Tests")
    
    for (i, test) in testCases.enumerated() {
        let (startPos, moveAmount, expectedEnd, expectedHits) = test
        let (actualEnd, actualHits) = moveDial(startingPosition: startPos, moveAmount: moveAmount)
        
        if actualEnd == expectedEnd && actualHits == expectedHits {
            passed += 1
            print("✅ Test \(i + 1) PASSED")
        } else {
            failed += 1
            print("❌ Test \(i + 1) FAILED")
            print("   Input: start=\(startPos), move=\(moveAmount)")
            print("   Expected: end=\(expectedEnd), hits=\(expectedHits)")
            print("   Got:      end=\(actualEnd), hits=\(actualHits)")
        }
    }
    
    printWithBorder("Results: \(passed) passed, \(failed) failed out of \(testCases.count)")
}
