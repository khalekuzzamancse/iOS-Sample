import SwiftUI
import CoreUI
import UIKit

#Preview{
    HomeScreen()
}
struct HomeScreen:View {
    private let features=[
        "Visualie algorithms step-by-step",
        "Custom input for different data scenarious",
        "Adjustable visualization speed"
        
    ]
    var body: some View {
        ScrollView{
            VStack(
                
            ){
                TextH1(text: "Welcome to Sample App")
                SpacerVertical(32)
                TextBody1(text: "Explore and understand the common algorithms taught in Data Structures and Algorithms courses throgh interactive visualizations.")
                SpacerVertical(32)
                TextH2(text: "Current Features")
                    .fillMaxWidth(alignment: .leading)
                
                
                HStack{
                    SpacerHorizontal(8)
                    VStack{
                        ForEach(features,id:\.self){feature in
                            TextPoint(text:feature).fillMaxWidth(alignment: .leading)
                        }
                        
                    }
                    
                }
                
                
                SpacerVertical(32)
                Divider()
                TextH2(text: "Visualize")
                    .fillMaxWidth(alignment: .leading)
                _NavigationItems()
                _NavigationItems()
                _NavigationItems()
                
            }
            .padding()
            .fillMaxHeight(alignment:.top)
        }
    }
}

