
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
        ProfileNavHost()
    }
}

#Preview {
   // NearByMessengerNavHost()
   ProfileNavHost()
}
