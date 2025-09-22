import SwiftUI

public struct ImageView<S: Shape>: View {
    private let image: ImageResource
    private let width: CGFloat
    private let height: CGFloat
    private let shape: S
  

    // Default shape is Rectangle
    public init(
        image: ImageResource,
        width: CGFloat,
        height: CGFloat,
        shape: S = Rectangle()
    ) {
        self.image = image
        self.width = width
        self.height = height
        self.shape = shape
        
    }
    // Default shape is Rectangle
    public init(
        image: ImageResource,
        size: CGFloat,
        shape: S = Rectangle()
    ) {
        self.image = image
        self.width = size
        self.height = size
        self.shape = shape
        
    }

    public var body: some View {
        Image(image)
            .resizable()
            .scaledToFill()
            .frame(width: width, height: height)
            .clipShape(shape)
            .clipped()
    }
}

public struct IconView<S: Shape>: View {
    private let icon: String
    private let width: CGFloat
    private let height: CGFloat
    private let shape: S
  

    // Default shape is Rectangle
    public init(
        icon: String,
        width: CGFloat,
        height: CGFloat,
        shape: S = Rectangle()
    ) {
        self.icon = icon
        self.width = width
        self.height = height
        self.shape = shape
        
    }
    // Default shape is Rectangle
    public init(
        icon: String,
        size: CGFloat,
        shape: S = Rectangle()
    ) {
        self.icon = icon
        self.width = size
        self.height = size
        self.shape = shape
        
    }

    public var body: some View {
        Image(systemName:icon)
            .frame(width: width, height: height)
            .clipShape(shape)
            .clipped()
    }
}

