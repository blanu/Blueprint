// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Blueprint",
    platforms: [
        .macOS(.v14),
        .iOS(.v17),
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Blueprint",
            targets: ["Blueprint"]),
    ],
    dependencies: [
        .package(url: "https://github.com/OperatorFoundation/Text", branch: "main"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Blueprint",
            dependencies: [
                "Text",
            ]
        ),
        .testTarget(
            name: "BlueprintTests",
            dependencies: ["Blueprint"]),
    ],
    swiftLanguageVersions: [.v5]
)
