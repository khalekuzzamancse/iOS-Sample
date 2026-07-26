import SwiftUI

@Observable class Controller{
    var count: Int=0
    func increment(){
        count+=1
    }
    
}

struct RootNavHost: View {
    @StateObject var navController = NavController()
   var body: some View {
       NavigationStack(path:$navController.navStack){
           VStack{
               Text("This is Splash Screen")
               Button(action:{navController.navigate(.login)}){Text("Login")}
           }
           .navigationDestination(for:Routes.self){ route in
               switch(route){
               case.login : LoginScreen(onLoginSuccess: {user in navController.navigate(.profile(username:user))})
               case.profile(let name):ProfileScreen(name: name)
                   
               }
               
           }
       }

   }
}

struct LoginScreen: View {
    var onLoginSuccess:(String)->Void
    var body: some View {
        VStack{
            Text("Login Screen")
            Button(action: {
                onLoginSuccess("Mr. Bean")
            }){
                Text("Success")
            }
        }
    }
}
struct ProfileScreen: View {
    var name:String
    var body: some View {
        VStack{
            Text("Profile Screen")
            Text("name:\(name)")
        }
    }
}

enum Routes: Codable, Hashable {
  case login
  case profile(username:String)
}

class NavController :ObservableObject{
  
  @Published var navStack = NavigationPath()
  
  func navigate(_ destination: Routes) {
      navStack.append(destination)
  }
  
  func pop() {
      navStack.removeLast()
  }
  
  func navigateToRoot() {
      navStack.removeLast(navStack.count)
  }
}


struct Display: View {
   var count:Int
   var body: some View {Text("\(count)")}
}
struct Action: View {
  var  onClick:  @MainActor () -> Void
   var body: some View {
       Button(action:onClick) {Text("Click me")}
   }
}




#Preview {

    RootNavHost()
}



struct Search:View {
    var body: some View {
        Text("Search Screen")
        RootNavHost()
    }
}

