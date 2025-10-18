
import SwiftUI
import CoreUI

struct BottomBar01:View {
    var body: some View {
        TabView {
            
            Tab("Home", systemImage: "house") {
                HomeScreen()
            }
            
            Tab("Search", systemImage: "magnifyingglass") {
              Search()
            }
            Tab("History", systemImage: "clock") {
                History()
            }

            Tab("Profile", systemImage: "person.crop.circle") {
              Profile()
            }
        
        }
        .accentColor(.yellow)
        .onAppear() {
            UITabBar.appearance().backgroundColor = .lightGray
            UITabBar.appearance().tintColor = .yellow
            UITabBar.appearance().unselectedItemTintColor = .red
          }
      
       
        
    }
}



#Preview {
    BottomBar01()
}
