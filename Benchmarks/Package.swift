// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "Benchmarks",
    dependencies: [
        .package(url: "https://github.com/apple/swift-collections-benchmark",
                 from: "0.0.3"),
        .package(url: "https://github.com/fang-ling/algorithms", from: "0.0.2")
    ],
    targets: [
        .executableTarget(
            name: "Benchmarks",
            dependencies: [
                .product(name: "tyx", package: "algorithms"),
                .product(name: "CollectionsBenchmark",
                         package: "swift-collections-benchmark")
            ]),
        .testTarget(
            name: "BenchmarksTests",
            dependencies: ["Benchmarks"]),
    ]
)
