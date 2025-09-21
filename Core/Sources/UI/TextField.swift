import SwiftUI

public struct TextFieldView: View {
    
    // Bound value
    @Binding public var value: String
    
    // Customizable properties
    public var hints: String
    public var contentPaddingH: CGFloat
    public var contentPaddingV: CGFloat
    
    // Optional leading icon
    public var leadingIcon: AnyView?
    
    public init(
        value: Binding<String>,
        hints: String = "",
        paddingHorizontal: CGFloat = 8,
        paddingVertical: CGFloat = 4,
        @ViewBuilder leadingIcon: () -> some View = { EmptyView() }
    ) {
        self._value = value
        self.hints = hints
        self.contentPaddingH = paddingHorizontal
        self.contentPaddingV = paddingVertical
        self.leadingIcon = AnyView(leadingIcon())
    }
    
    public var body: some View {
        let shape = RoundedRectangle(cornerRadius: 30)
        
        HStack {
            if !(leadingIcon is EmptyView) {
                leadingIcon
            }
            
            TextField(hints, text: $value)
                .textFieldStyle(.plain)
        }
        .padding(.horizontal, contentPaddingH)
        .padding(.vertical, contentPaddingV)
        .background(shape.stroke(Color.black,lineWidth: 1))
        .clipShape(shape)
    }
}
