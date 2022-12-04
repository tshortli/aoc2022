// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "aoc2022",
    products: [
        .library(
            name: "aoc",
            targets: ["aoc"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "aoc",
            dependencies: []),
        .testTarget(
            name: "aocTests",
            dependencies: ["aoc"]),
    ]
)
