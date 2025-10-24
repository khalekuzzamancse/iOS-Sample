// swift-tools-version: 6.1
import PackageDescription

let package = Package(
    name: "UiComponents",
    platforms: [
        .iOS(.v18)
    ],
    products: [
        Product.library(
            name: "UiComponents",
            targets: ["UiComponents"]
        ),
    
    ],
    dependencies: [
        // Sibling Core package
        .package(path: "../Core")
       
    ],
    targets: [
        .target(
            name: "UiComponents",
            dependencies: [
                .product(name: "CoreLib", package: "Core"),
            ]
        )
    ]
)

