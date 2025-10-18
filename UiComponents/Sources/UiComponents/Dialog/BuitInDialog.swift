import SwiftUI
import CoreUI

#Preview {
    AlertDemo()
}

    
struct AlertDemo: View {
    var body: some View {
        VStack{
            SaveButton()
        }
    }
}



private struct SaveDetails: Identifiable {
    let name: String
    let error: String
    let id = UUID()
}


private struct SaveButton: View {
    @State private var didError = false
    @State private var details: SaveDetails?
    let alertTitle: String = "Save failed."

    var body: some View {
        Button("Save") {
            details = SaveDetails(name: "File1", error: "Could not save your file.")
            didError = true
        }
        .alert(
            "Confirmation",
            isPresented: $didError,
            presenting: details,
            actions:  { details in
                _Button(
                    label:"Register",
                    onClick: {
                        print("Register Clicekd")
                    }
                )
                _Button(
                    label:"Cancel",
                    onClick: {
                        print("Cancel Clicekd")
                    }
                )
              
            },
        
        message: { details in
            Text(details.error)
        }
    )
    }
}

private struct _Button: View{
    let label:String
    let onClick:()->Void
    var body: some View{
        
        ButtonViewSolid(
            label:label,
            shape:AnyView(RoundedRectangle(cornerRadius:10)),
            paddingHorizontal: 8,
            paddingVertical: 8,
            fontSize:25,
            minWidth:250,
            onClick:onClick
        )
    }
    
    
    
}

