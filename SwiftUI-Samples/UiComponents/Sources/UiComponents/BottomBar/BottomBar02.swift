
import SwiftUI
import CoreUI

struct BottomBar02:View {
    var body: some View {
        TabView {

                HomeScreen()
                    .tabItem{
                        HStack{
                            IconView(icon: "house", size: 48)
                            Text("Home")
                        }
                        
                    }
                
                Search()
                    .tabItem{
                        HStack{
                            IconView(icon: "magnifyingglass", size: 48)
                            Text("Search")
                        }
                    }
                History()
                    .tabItem{
                        HStack{
                            IconView(icon: "clock", size: 48)
                            Text("History")
                        }
                    }
                Profile()
                    .tabItem{
                        HStack{
                            IconView(icon: "person.crop.circle", size: 48)
                            Text("Profile")
                        }
                    }
                
            
        }
        
       
        
    }
}



#Preview {
    BottomBar02()
}

