import SwiftUI
import CoreUI

struct RegisterScreen: View {
    @State private var username = ""
    @State private var password = ""
    var body: some View {
        
        VStack(
            spacing: 24,
        ){
          
            SpacerVertical(64)
            TextView(
                text: "Create an account",
                fontSize: 25,
             
            )
            SpacerVertical(32)
            AuthTextField(
                value: $username,
                hints: "First name",
                leadingIcon:{
                  
                    Image(systemName: "person.circle.fill")
                        .font(.system(size: 20))
                        .foregroundColor(.blue)
                },
            )
            .widthIn(max: 400)
            AuthTextField(
                value: $username,
                hints: "Lastname",
                leadingIcon:{
                  
                    Image(systemName: "person.circle.fill")
                        .font(.system(size: 20))
                        .foregroundColor(.blue)
                },
            )
            .widthIn(max: 400)
            AuthTextField(
                value: $username,
                hints: "email",
                leadingIcon:{
                  
                    Image(systemName: "envelope.circle.fill")
                        .font(.system(size: 20))
                        .foregroundColor(.blue)
                },
            )
            .widthIn(max: 400)
            AuthTextField(
                value: $username,
                hints: "phone number",
                leadingIcon:{
                  
                    Image(systemName: "phone.circle.fill")
                        .font(.system(size: 20))
                        .foregroundColor(.blue)
                },
            )
            .widthIn(max: 400)
            PasswordField(
                password: $password, hints: "Password"
            
            ).widthIn(max: 400)
    
            PasswordField(
                password: $password, hints: "Confirm password"
            ).widthIn(max: 400)
            SpacerVertical(16)
            ButtonViewSolid(
                label:"Register",
                shape:AnyView(RoundedRectangle(cornerRadius:10)),
                paddingHorizontal: 8,
                paddingVertical: 8,
                fontSize:25,
                minWidth:250,
                onClick: {}
            )
            SpacerVertical(8)
           
            
        }
        .padding()
    
        
    }
}

#Preview {
    RegisterScreen()
}
