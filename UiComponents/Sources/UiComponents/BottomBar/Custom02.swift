import SwiftUI
import CoreUI
struct BottomBarCustom02: View {
    @State private var selectedTab: TopRoute = .home
  
    var body: some View {

            ZStack(alignment: .bottom) {
                Group {
                    switch selectedTab {
                    case .home:
                        HomeScreen()
                    case .search:
                        Search()
                    case .fab:
                          Text("Fab")
                    case .history:
                        History()
                    case .profile:
                        Profile()
                    }
                }
                .fillMaxSize()
                _BottomBar(selectedTab: $selectedTab)
                _Fab(selectedTab:$selectedTab)
               
            }
            .animation(.easeInOut(duration: 0.25), value: selectedTab)
        
    }



}

private struct _Fab: View {
    
    @Binding var selectedTab: TopRoute
    
    var body: some View {
        Button {
            selectedTab = .fab
        } label: {
            ZStack {
                Circle()
                    .fill(Color.blue)
                    .frame(width: 56, height: 56)
                    .shadow(color: .black.opacity(0.2), radius: 6, x: 0, y: 4)
                Image(systemName: "plus")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(.white)
            }
        }
        .offset(y: -20)
        .frame(maxWidth: .infinity)
        .zIndex(1)
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
    case home, search,fab, history, profile
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
#Preview {
    BottomBarCustom02()
}

