// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Sugar",
    platforms: [
        .iOS(.v11),
    ],
    products: [
        .library(
            name: "Sugar",
            targets: ["Sugar"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Sugar",
            dependencies: []),
        .testTarget(
            name: "SugarTests",
            dependencies: ["Sugar"]),
    ]
)
