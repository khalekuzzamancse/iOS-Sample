
import SwiftUI
#Preview {
    ContentView()
}
@MainActor
final class PlainBox {
    var number = 0
}

@MainActor
let plainBox = PlainBox()

struct ContentView: View {
    @State private var refreshFlag = false

    var body: some View {
        VStack {
        
            Button("Change plain value") {
                plainBox.number += 1
            }

        }
        .onChange(of: plainBox.number) { oldValue, newValue in
            print("\(oldValue) → \(newValue)")
        }
    }
}

