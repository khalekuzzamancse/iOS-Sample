
import SwiftUI
import CoreUI
public struct Register:View{
    @State private var username = ""
    public init(){}
    public var body: some View{
        
        Column{
            TextView(
                text:"This name will identify you to nearby devices. Choose a unique name. If the among group multiple device has the same may cause data loss and unwanted behavior",
                fontSize : 16,
                
            )
        
            TextFieldView(
                value: $username,
                hints: "Username",
                leadingIcon:{
                    Image(systemName: "person.fill")
                        .font(.system(size: 20))
                        .foregroundColor(.blue)
                }
                
            )
            
            ButtonViewSolid(
                label:"Register",
                shape:AnyView(RoundedRectangle(cornerRadius:10)),
                paddingHorizontal: 8,
                paddingVertical: 4,
                fontSize:25,
                minWidth:250,
                onClick: {}
            )
            
            
        }
        
        
    
        
        
    }
    
}
