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
    .package(url: "https://github.com/apple/swift-algorithms", from: "1.0.0"),
  ],
  targets: [
    .target(
      name: "aoc",
      dependencies: [
        .product(name: "Algorithms", package: "swift-algorithms"),
      ]),
    .testTarget(
      name: "aocTests",
      dependencies: ["aoc"]),
  ]
)
