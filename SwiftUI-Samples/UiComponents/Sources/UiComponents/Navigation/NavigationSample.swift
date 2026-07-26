import SwiftUI

#Preview {
    RootNavHostX()
}

struct RootNavHostX: View {
   @StateObject var navController = NavControllerY()
  var body: some View {
      NavigationStack(path:$navController.navStack){
          VStack{
              Text("This is Splash Screen")
              Button(action:{navController.navigate(.login)}){Text("Login")}
          }
          .navigationDestination(for:Routes.self){ route in
              switch(route){
              case.login : LoginScreenY(onLoginSuccess: {user in  navController.navigate(.profile(username:user))})
              case.profile(let name):ProfileScreenY(name: name)
              }
          }
      }
  }
}
class NavControllerY :ObservableObject{
 @Published var navStack = NavigationPath()
 func navigate(_ destination: Routes) { navStack.append(destination)}
 func pop() { navStack.removeLast()}
 func navigateToRoot() { navStack.removeLast(navStack.count)}
}
enum RoutesY: Codable, Hashable {
 case login
 case profile(username:String)
}
struct LoginScreenY: View {
   var onLoginSuccess:(String)->Void
   var body: some View {
       VStack{
           Text("Login Screen")
           Button(action: {  onLoginSuccess("Mr. Bean") }){ Text("Success") }
       }
   }
}
struct ProfileScreenY: View {
   var name:String
   var body: some View {
       VStack{
           Text("Profile Screen")
           Text("name:\(name)")
       }
   }
}


