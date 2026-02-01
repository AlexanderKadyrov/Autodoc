// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Autodoc",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "Autodoc",
            targets: ["Autodoc"]
        )
    ],
    dependencies: [
        .package(url: "git@github.com:AlexanderKadyrov/Network.git", exact: "1.0.5"),
        .package(url: "git@github.com:AlexanderKadyrov/UI.git", exact: "1.0.3")
    ],
    targets: [
        .target(
            name: "Autodoc",
            dependencies: [
                "Network",
                "UI"
            ]
        )
    ]
)
