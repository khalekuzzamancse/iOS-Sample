import SwiftUI
import CoreUI


public struct AuthTextField<Leading: View, Trailing: View>: View {
    @Binding public var value: String
    public var hints: String
    public var contentPaddingH: CGFloat
    public var contentPaddingV: CGFloat
    public var leadingIcon: () -> Leading
    public var trailingIcon: () -> Trailing
    public var onValueChange: (String) -> Void
    public var onSubmit: () -> Void
    private let cornerRadius: CGFloat

    public init(
        value: Binding<String>,
        hints: String = "",
        paddingHorizontal: CGFloat = 8,
        paddingVertical: CGFloat = 4,
        cornerRadius: CGFloat = 10,
        @ViewBuilder leadingIcon: @escaping () -> Leading = { EmptyView() },
        @ViewBuilder trailingIcon: @escaping () -> Trailing = { EmptyView() },
        onValueChange: @escaping (String) -> Void = { _ in },
        onSubmit: @escaping () -> Void = {}
    ) {
        self._value = value
        self.hints = hints
        self.contentPaddingH = paddingHorizontal
        self.contentPaddingV = paddingVertical
        self.leadingIcon = leadingIcon
        self.trailingIcon = trailingIcon
        self.onValueChange = onValueChange
        self.onSubmit = onSubmit
        self.cornerRadius = cornerRadius
    }

    public var body: some View {
        let shape = RoundedRectangle(cornerRadius: cornerRadius)
        
        HStack(spacing: 8) {
            // Leading icon
            leadingIcon()
            
            // Text field
            TextField(hints, text: $value)
                .textFieldStyle(.plain)
                .onChange(of: value) { newValue in
                    onValueChange(newValue)
                }
                .onSubmit {
                    onSubmit()
                }
                .autocorrectionDisabled(true)    
                  .textInputAutocapitalization(.never)
            
            // Trailing icon
            trailingIcon()
        }
        .padding(.horizontal, contentPaddingH)
        .padding(.vertical, contentPaddingV)
        .background(shape.stroke(Color.black, lineWidth: 1))
        .clipShape(shape)
    }
}

struct PasswordField: View {
    @Binding var password:String
    let hints: String
    @State private var show = true
    @State private var masked = ""
    
    var body: some View {
        AuthTextField(
            value: show ? $password : $masked,
            hints: hints,
            leadingIcon: {
                IconView(icon: "lock.circle.fill", size:20,tint: .blue)
            },
            trailingIcon: {
                
                IconView(icon: show ? "eye.slash" : "eye", size:20,tint: .blue)
                    .onTapGesture {
                        if show {
                            // Going from visible → masked
                            masked = String(repeating: "*", count: password.count)
                        } else {
                            // Going from masked → visible
                            password = password // keep real password
                        }
                        show.toggle()
                    }
            }
        )
       
        .onChange(of: masked) { newMasked in
            // Only update password if new character is typed (not a backspace)
            if newMasked.count > password.count {
                let diff = newMasked.count - password.count
                let addedChars = Array(newMasked.suffix(diff))
                password.append(contentsOf: addedChars)
            } else if newMasked.count < password.count {
                // handle backspace
                password = String(password.prefix(newMasked.count))
            }
            masked = String(repeating: "*", count: password.count)
            
        }
    }
}
