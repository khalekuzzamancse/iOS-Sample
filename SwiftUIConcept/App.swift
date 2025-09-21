
import SwiftUI
import SwiftUI
import CoreUI
import NearByMessenger


@main
struct SwiftUIConceptApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}


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
   // NearByMessengerNavHost()
   ProfileNavHost()
}
