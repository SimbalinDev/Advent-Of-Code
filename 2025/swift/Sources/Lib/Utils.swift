//
//  Utils.swift
//  AdventOfCode2025
//
//  Created by Connor Gaunt on 05/12/2025.
//

public func printWithBorder(_ value: String, spaceAbove: Bool = true, spaceBelow: Bool = true) {
    print((spaceAbove ? "\n" : "") + String(repeating: "=", count: 50))
    print(value)
    print(String(repeating: "=", count: 50) + (spaceBelow ? "\n" : ""))
}
