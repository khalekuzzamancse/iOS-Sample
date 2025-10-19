import SwiftUI
import CoreUI


struct LoginScreen: View {
    @State private var username = ""
    var body: some View {
        
        VStack{
            _Logo()
            SpacerVertical(64)
            TextView(
                text: "Login",
                fontSize: 25,
             
            )
            SpacerVertical(32)
            AuthTextField(
                value: $username,
                hints: "Username",
                leadingIcon:{
                  
                    Image(systemName: "person.fill")
                        .font(.system(size: 20))
                        .foregroundColor(.blue)
                },
            )
            .widthIn(max: 400)
            SpacerVertical(32)
            PasswordField()
                .widthIn(max: 400)
            SpacerVertical(48)
            ButtonViewSolid(
                label:"Login",
                shape:AnyView(RoundedRectangle(cornerRadius:10)),
                paddingHorizontal: 8,
                paddingVertical: 8,
                fontSize:25,
                minWidth:250,
                onClick: {}
            )
            SpacerVertical(16)
            TextView(
                text: "Or",
                fontSize: 25,
             
            )
            SpacerVertical(16)
            ButtonViewSolid(
                label:"Create an Account",
                shape:AnyView(RoundedRectangle(cornerRadius:10)),
                paddingHorizontal: 8,
                paddingVertical: 8,
                fontSize:25,
                minWidth:250,
                onClick: {}
            )
            
        }
        .padding()
    
        
    }
    
}

private struct _Logo: View {
    var body: some View {
        ZStack{
            TextView(
                text: "Logo",
                color:.blue,
                fontSize: 60,
             
            )
        }
    }
}



#Preview {
    LoginScreen()
}
