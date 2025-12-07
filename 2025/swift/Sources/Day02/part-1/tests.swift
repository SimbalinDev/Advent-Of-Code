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
    ("95-115", 99),             // Test 2: Range with only 99
    ("998-1012", 1010),         // Test 3: Range with 1010
    ("1-10", 0),                // Test 4: Small range with no invalid IDs
    ("55-55", 55),              // Test 5: Single number that is invalid
    ("56-56", 0),               // Test 6: Single number that is valid
    
    // Edge cases - small invalid IDs
    ("10-12", 11),              // Test 7: Contains 11
    ("21-23", 22),              // Test 8: Contains 22
    ("32-34", 33),              // Test 9: Contains 33
    ("98-100", 99),             // Test 10: Contains 99
    ("1-100", 495),             // Test 11: 11+22+33+44+55+66+77+88+99
    
    // Edge cases - four digit patterns
    ("1000-2000", 14645),        // Test 12: 1010+1111+1212+1313+1414+1515+1616+1717+1818+1919
    ("6363-6465", 12827),        // Test 13: Contains 6464
    ("123122-123124", 123123),  // Test 14: Contains 123123
    
    // No invalid IDs
    ("1698522-1698528", 0),     // Test 15: From problem - no invalid IDs
    ("100-110", 0),             // Test 16: No invalid IDs in range
    ("1-5", 0),                 // Test 17: Very small range
    
    // Multiple ranges (comma separated)
    ("11-22,95-115", 132),                    // Test 18: Two ranges (33 + 99)
    ("11-11,22-22,33-33", 66),                // Test 19: Three single invalid IDs
    ("1-10,90-100", 99),                      // Test 20: Two ranges, one has invalid ID
    ("1698522-1698528,446443-446449", 446446), // Test 21: Two ranges, one empty
    
    // Large numbers from problem
    ("1188511880-1188511890", 1188511885),    // Test 22: Large range with one invalid
    ("222220-222224", 222222),                // Test 23: Contains 222222
    ("38593856-38593862", 38593859),          // Test 24: Contains 38593859
    
    // The full example from the problem
    ("11-22,95-115,998-1012,1188511880-1188511890,222220-222224,1698522-1698528,446443-446449,38593856-38593862,565653-565659,824824821-824824827,2121212118-2121212124", 1227775554),  // Test 25: Full example
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
