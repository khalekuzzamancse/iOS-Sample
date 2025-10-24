
import SwiftUI
import SwiftUI
import CoreUI
import NearByMessenger
import AlgorithmsVisualizer
import UiComponents

@main
struct SwiftUIConceptApp: App {
    var body: some Scene {
        WindowGroup {
           UIComponentsEntryPoint()
        }
    }
}




#Preview {
  // NearByMessengerNavHost()
   //ProfileNavHost()
   // Demo()
   AlgorithmsVisualizerEntryPoint()
    
}

struct Demo: View {
    
    var body: some View {
        
        VStack{
            VStack{
                Text("Upload Profile Photo")
                
               // Spacer()
                
                SubView()
                
            }
            .frame(height: 300)
            .background(Color.green.opacity(0.5))
        }
        .fillMaxHeight()
        .background(Color.blue.opacity(0.3))
    
     
        
    }
}


struct SubView: View {
    var body: some View {
        ZStack{
            Color.clear
        }
        .frame(height: 70)
        .background(Color.red)
    }
}
