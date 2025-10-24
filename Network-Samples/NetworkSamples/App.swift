

import SwiftUI

@main
struct NetworkSamplesApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}


struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, n!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
