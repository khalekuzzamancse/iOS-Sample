// swift-tools-version: 6.1
import PackageDescription

let package = Package(
    name: "CoreNetwork",
    platforms: [
        .iOS(.v18),
        .macOS(.v15)
        
    ],
    products: [
        Product.library(
            name: "CoreNetwork",
            targets: ["CoreNetwork"]
            
        ),
       
    
    ],
    dependencies: [

       
    ],
    targets: [
        Target.target(
            name: "CoreNetwork",
            dependencies: [
               
            ]
        ),
        
        Target.testTarget(
                    name: "CoreNetworkTests",
                    dependencies: ["CoreNetwork"],
                   
                )
    ]

)

