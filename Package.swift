// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "tyx",
    products: [
        .library(
            name: "tyx",
            targets: ["tyx"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "tyx",
            dependencies: []),
        .testTarget(
            name: "tyxTests",
            dependencies: ["tyx"]),
    ]
)
