
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
            SpacerVertical(height: 32)
            _Image()
            SpacerVertical(height: 16)
            
            TextFieldView(
                value: $username,
                hints: "Username",
                leadingIcon:{
                    Image(systemName: "person.fill")
                        .font(.system(size: 20))
                        .foregroundColor(.blue)
                }
                
            )
            
            SpacerVertical(height: 64)
            ButtonViewSolid(
                label:"Register",
                shape:AnyView(RoundedRectangle(cornerRadius:10)),
                paddingHorizontal: 8,
                paddingVertical: 8,
                fontSize:25,
                minWidth:250,
                onClick: {}
            )
            
            
        }
    
        
    }
    
}

struct _Image: View {
    private let imageSize:CGFloat=100
    private let iconSize:CGFloat=30
    
    var body: some View {
        ZStack{
            ImageView(
                image: .profile,
                size: imageSize,
                shape: Circle()
            )
            
            ZStack{
                IconView(
                    icon: "camera",
                    size:iconSize
                )
            }
            .background(
            RoundedRectShape(radius: iconSize/2,color:Color.yellow))
            
        .position(x: imageSize, y: imageSize/2)
        }
        .size(value: 100)
       
      
        
    }
}

