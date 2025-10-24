// swift-tools-version: 6.1
import PackageDescription

let package = Package(
    name: "ChatApp",
    platforms: [
        .iOS(.v18)
    ],
    products: [
        Product.library(
            name: "ChatApp",
            targets: ["ChatApp"]
        ),
    
    ],
    dependencies: [
        // Sibling Core package
        .package(path: "../Core")
       
    ],
    targets: [
        .target(
            name: "ChatApp",
            dependencies: [
                .product(name: "CoreLib", package: "Core"),
            ]
        )
    ]
)

