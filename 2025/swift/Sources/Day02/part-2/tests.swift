//
//  tests.swift
//  AdventOfCode2025
//
//  Created by Connor Gaunt on 02/12/2025.
//
import Lib

// Test format: (rangeInput, expectedSum)
let testCases: [(String, Int)] = [
    // Single range - basic cases
    ("11-22", 33),              // Test 1: Range with 11 and 22
    ("95-115", 210),            // Test 2: Range with 99 and 111 (99 + 111)
    ("998-1012", 2009),         // Test 3: Range with 999 and 1010 (999 + 1010)
    ("1-10", 0),                // Test 4: Small range with no invalid IDs
    ("55-55", 55),              // Test 5: Single number that is invalid
    ("56-56", 0),               // Test 6: Single number that is valid
    
    // Edge cases - small invalid IDs
    ("10-12", 11),              // Test 7: Contains 11
    ("21-23", 22),              // Test 8: Contains 22
    ("32-34", 33),              // Test 9: Contains 33
    ("98-100", 99),             // Test 10: Contains 99
    ("1-100", 495),             // Test 11: 11+22+33+44+55+66+77+88+99
    
    // Edge cases - patterns repeated 3+ times
    ("110-112", 111),           // Test 12: Contains 111 (1 three times)
    ("998-1000", 999),          // Test 13: Contains 999 (9 three times)
    ("1110-1112", 1111),        // Test 14: Contains 1111 (1 four times or 11 twice)
    ("1-1000", 5490),           // Test 15: All 2-digit and 3-digit repeated patterns
    
    // Four digit patterns
    ("1000-2000", 14645),       // Test 16: 1010+1111+1212+1313+1414+1515+1616+1717+1818+1919
    ("6363-6465", 12827),       // Test 17: Contains 6363 and 6464
    ("123122-123124", 123123),  // Test 18: Contains 123123
    
    // No invalid IDs
    ("1698522-1698528", 0),     // Test 19: From problem - no invalid IDs
    ("100-110", 0),             // Test 20: No invalid IDs in range
    ("1-5", 0),                 // Test 21: Very small range
    
    // Multiple ranges (comma separated)
    ("11-22,95-115", 243),                    // Test 22: Two ranges (33 + 210)
    ("11-11,22-22,33-33", 66),                // Test 23: Three single invalid IDs
    ("1-10,90-100", 99),                      // Test 24: Two ranges, one has invalid ID
    ("1698522-1698528,446443-446449", 446446), // Test 25: Two ranges, one empty
    
    // Large numbers from problem
    ("1188511880-1188511890", 1188511885),    // Test 26: Large range with one invalid
    ("222220-222224", 222222),                // Test 27: Contains 222222
    ("38593856-38593862", 38593859),          // Test 28: Contains 38593859
    ("565653-565659", 565656),                // Test 29: Contains 565656 (new in part 2)
    ("824824821-824824827", 824824824),       // Test 30: Contains 824824824 (new in part 2)
    ("2121212118-2121212124", 2121212121),    // Test 31: Contains 2121212121 (new in part 2)
    
    // The full example from the problem (Part 2)
    ("11-22,95-115,998-1012,1188511880-1188511890,222220-222224,1698522-1698528,446443-446449,38593856-38593862,565653-565659,824824821-824824827,2121212118-2121212124", 4174379265),  // Test 32: Full example for Part 2
]

// Test runner
func runTests(_ specificIndex: Int = -1) {
    var passed = 0
    var failed = 0
    
    printWithBorder("Starting Tests")
    
    for (i, test) in testCases.enumerated() {
        if specificIndex == -1 || specificIndex == i {
            let (input, expectedSum) = test
            let actualSum = solve(ids: input)
            
            if actualSum == expectedSum {
                passed += 1
                print("✅ Test \(i + 1) PASSED: Range: \(input) -- Output: \(actualSum)")
            } else {
                failed += 1
                print("❌ Test \(i + 1) FAILED")
                print("   Input: \(input)")
                print("   Expected sum: \(expectedSum)")
                print("   Got sum:      \(actualSum)")
            }
        }
    }
    
    printWithBorder("Results: \(passed) passed, \(failed) failed out of \(testCases.count)")
}
