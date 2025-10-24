import SwiftUI
import CoreUI


#Preview {
   BottomBarCustom03()
}


struct BottomBarCustom03: View {
    @State private var selectedTab: TopRoute = .home
  
    var body: some View {

            ZStack(alignment: .bottom) {
                Group {
                    switch selectedTab {
                    case .home:
                        _HomeScreen(
                            bottomBar:{
                                _BottomBar(selectedTab: $selectedTab)
                            }
                        )
                       
                     
                    case .search:
                        _SearchScreen(
                            bottomBar:{
                                _BottomBar(selectedTab: $selectedTab)
                            }
                        )
                       
                    case .history:
                        _History(
                        bottomBar:{
                            _BottomBar(selectedTab: $selectedTab)
                        }
                    )
                    case .profile:
                        _Profile(
                            bottomBar:{
                                _BottomBar(selectedTab: $selectedTab)
                            }
                        )
                    }
                }
                .fillMaxSize()
               //_BottomBar(selectedTab: $selectedTab)
            }
         
        
    }

  
   

}



private struct _BottomBar: View {
    @Binding var selectedTab: TopRoute
 
    
    var body: some View {
        VStack(spacing: 0) {
            Divider()
                .background(Color.black.opacity(0.1))
            
            HStack(spacing: 0) {
                TabButtonView(tab: .home, icon: "house", label: "Home", selectedTab: $selectedTab)

                TabButtonView(tab:.search, icon: "magnifyingglass", label: "Search",selectedTab: $selectedTab)
                TabButtonView(tab:.history, icon: "clock", label: "History",selectedTab: $selectedTab)
                TabButtonView(tab:.profile, icon: "person.crop.circle", label: "Profile",selectedTab: $selectedTab)
            }
            .frame(height: 60)
            .background(Color(.systemGray6))
        }
        .fillMaxWidth()
        .background(Color(.systemGray6))
        .ignoresSafeArea(.all, edges: .bottom)
        .shadow(color: .black.opacity(0.08), radius: 6, x: 0, y: -2)
    }
}

private enum TopRoute {
    case home, search, history, profile
}

private struct TabButtonView: View {
    let tab: TopRoute
    let icon: String
    let label: String
    @Binding var selectedTab: TopRoute

    var body: some View {
        Button {
            selectedTab = tab
        } label: {
            VStack(spacing: 4) {
                IconView(icon: icon, size: 26)
                    .foregroundColor(selectedTab == tab ? .blue : .gray)
                Text(label)
                    .font(.caption2)
                    .foregroundColor(selectedTab == tab ? .blue : .gray)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 6)
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
    }
}

private struct _HomeScreen<BottomBar: View>: View {
    private let bottomBar: () -> BottomBar
    init(
      
        @ViewBuilder bottomBar: @escaping () -> BottomBar
    ) {
        self.bottomBar = bottomBar
    }
    
    var body: some View {
        ScreenStrategy(
            content: {
                HomeScreen()
            },
            bottomBar:bottomBar
        )
    }
}



private struct ScreenA: View {
    var body: some View {
        Text("Welcome to Screen A")
            .font(.largeTitle)
            .padding()
    }
}

private struct _SearchScreen<BottomBar: View>: View {
    private let bottomBar: () -> BottomBar
    
    init(@ViewBuilder bottomBar: @escaping () -> BottomBar) {
        self.bottomBar = bottomBar
    }
    
    var body: some View {
        NavigationStack {
            ScreenStrategy(
                content: {
                    VStack(spacing: 20) {
                        Text("Search")
                            .font(.title)
                        NavigationLink(destination: ScreenA()) {
                            Text("Go to Screen A")
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(8)
                        }
                    }
                    .padding()
                },
                bottomBar: bottomBar
            )
        }
    }
}



private struct _History<BottomBar: View>: View {
    private let bottomBar: () -> BottomBar
    init(
      
        @ViewBuilder bottomBar: @escaping () -> BottomBar
    ) {
        self.bottomBar = bottomBar
    }
    
    var body: some View {
        ScreenStrategy(
            content: {
                History()
            },
            bottomBar:bottomBar
        )
    }
}
private struct _Profile<BottomBar: View>: View {
    private let bottomBar: () -> BottomBar
    init(
      
        @ViewBuilder bottomBar: @escaping () -> BottomBar
    ) {
        self.bottomBar = bottomBar
    }
    
    var body: some View {
        ScreenStrategy(
            content: {
                Profile()
            },
            bottomBar:bottomBar
        )
    }
}




