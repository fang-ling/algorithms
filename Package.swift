// swift-tools-version: 5.7

import PackageDescription

let package = Package(
  name: "tyx",
  products: [
    .library(
      name: "Algorithms",
      targets: ["Algorithms"]
    ),
  ],
  dependencies: [
    .package(url: "https://github.com/fang-ling/collections", from: "0.0.7")
  ],
  targets: [
    .target(
      name: "Algorithms",
      dependencies: [
        .product(name: "Collections", package: "collections")
      ]
    ),
    .testTarget(
      name: "AlgorithmsTests",
      dependencies: ["Algorithms"]
    ),
  ]
)
