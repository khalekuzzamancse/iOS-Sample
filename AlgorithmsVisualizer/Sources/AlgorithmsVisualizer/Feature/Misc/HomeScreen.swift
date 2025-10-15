
import SwiftUI
import CoreUI
import UIKit
struct HomeScreen:View {
    private let features=[
        "Visualie algorithms step-by-step",
        "Custom input for different data scenarious",
        "Adjustable visualization speed"
        
    ]
    var body: some View {
        
        VStack(
        
        ){
            TextH1(text: "Welcome to Algorithms Visualizer")
            SpacerVertical(32)
            TextBody1(text: "Explore and understand the common algorithms taught in Data Structures and Algorithms courses throgh interactive visualizations.")
            SpacerVertical(32)
            TextH2(text: "Current Features")
                .fillMaxWidth(alignment: .leading)

            ForEach(features,id:\.self){feature in
                TextPoint(text:feature).fillMaxWidth(alignment: .leading)
            }
            
        }
        .padding()
        .fillMaxHeight(alignment:.top)


        
    }
}

struct JustifiedText: UIViewRepresentable {
    var text: String
    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.text = text
        textView.textAlignment = .justified
        textView.font = .systemFont(ofSize: 18)
        
        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        
    }
}
