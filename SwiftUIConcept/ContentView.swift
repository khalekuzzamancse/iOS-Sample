
import SwiftUI
import CoreUI
import NearByMessenger

struct ContentView: View {
    var body: some View {
        VStack {
            TextView(
                text:"symbol",
                fontSize: 16,
            )
        }
    }
}

#Preview {
    NearByMessengerNavHost()
}
