// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "todo_task_swiftui",
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: "https://github.com/stevengharris/MarkupEditor.git", from: "0.0.1"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .executableTarget(
            name: "todo_task_swiftui",
            dependencies: []),
        .testTarget(
            name: "todo_task_swiftuiTests",
            dependencies: ["todo_task_swiftui"]),
    ]
)
