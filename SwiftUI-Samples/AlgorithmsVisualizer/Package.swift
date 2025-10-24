// swift-tools-version: 6.1
import PackageDescription

let package = Package(
    name: "AlgorithmsVisualizer",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        Product.library(
            name: "AlgorithmsVisualizer",
            targets: ["AlgorithmsVisualizer"]
        ),
    
    ],
    dependencies: [
        // Sibling Core package
        .package(path: "../Core")
       
    ],
    targets: [
        .target(
            name: "AlgorithmsVisualizer",
            dependencies: [
                .product(name: "CoreLib", package: "Core"),
            ]
        )
    ]
)

