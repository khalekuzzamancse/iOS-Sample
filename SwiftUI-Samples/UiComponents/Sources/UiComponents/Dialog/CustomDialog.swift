import SwiftUI

#Preview {
    CustomDialog()
}
private struct CustomDialog: View {
    @State private var showDialog = false
    
    var body: some View {
        
        ZStack {
            VStack{
                Text("Hello")
                Button("Open Dialog") {
                    showDialog = true
                }

                
            }.fillMaxHeight(alignment: .topLeading)
           
            if showDialog {
                _Dialog(showDialog: $showDialog)
                   
            }
        }
        .animation(.easeInOut, value: showDialog)
    }
}

private struct _Dialog: View {
    @Binding var showDialog: Bool
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.4)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("Custom Dialog")
                    .font(.headline)
                Text("Here is full control over layout!")
                HStack {
                    Button("Cancel") { showDialog = false }
                    Spacer()
                    Button("OK") { showDialog = false }
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(12)
            .shadow(radius: 10)
            .frame(maxWidth: 300)
        }
    }
}
