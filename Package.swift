// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "BootMonitor",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "BootMonitor",
            targets: ["BootMonitor"]
        )
    ],
    targets: [
        .target(
            name: "BootMonitor",
            path: "."
        )
    ]
)