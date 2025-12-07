// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AdventOfCode2025",
    platforms: [.macOS(.v26)],
    products: [
        .executable(name: "day01p1", targets: ["Day01P1"]),
        .executable(name: "day01p2", targets: ["Day01P2"]),
        .executable(name: "day02p1", targets: ["Day02P1"]),
        .executable(name: "day02p2", targets: ["Day02P2"]),
        .executable(name: "day03p1", targets: ["Day03P1"]),
        .executable(name: "day03p2", targets: ["Day03P2"]),

        .library(name: "Lib", targets: ["Lib"]),
    ],
    targets: [
        .target(
            name: "Lib",
            path: "Sources/Lib",
            resources: [.copy("Data")],
        ),
        .executableTarget(
            name: "Day01P1",
            dependencies: ["Lib"],
            path: "Sources/Day01/part-1",
        ),
        .executableTarget(
            name: "Day01P2",
            dependencies: ["Lib"],
            path: "Sources/Day01/part-2",
        ),
        .executableTarget(
            name: "Day02P1",
            dependencies: ["Lib"],
            path: "Sources/Day02/part-1",
        ),
        .executableTarget(
            name: "Day02P2",
            dependencies: ["Lib"],
            path: "Sources/Day02/part-2",
        ),
        .executableTarget(
            name: "Day03P1",
            dependencies: ["Lib"],
            path: "Sources/Day03/part-1",
        ),
        .executableTarget(
            name: "Day03P2",
            dependencies: ["Lib"],
            path: "Sources/Day03/part-2",
        ),
    ]

)
