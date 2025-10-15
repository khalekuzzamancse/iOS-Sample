
import SwiftUI
import CoreUI

struct AboutUsScreen:View {
  
    
    
    var body: some View {
        ScrollView {
            VStack(
            ){
                
                _Item(
                    title:"Supervised by",
                    name: "Sk. Shalauddin Kabir",
                    image: .superVicer,
                    subtitle: "Lecturer",
                    extra: "Department of CSE at Jashore University of Science and Technology (JUST)"
                )
                SpacerVertical(32)
                _Item(
                    title:"Developed by",
                    name: "Md. Khalekuzzaman",
                    image: .imageDeveloper,
                    subtitle: "Student",
                    extra: "Department of CSE at Jashore University of Science and Technology (JUST)"
                )
                
                _CopyWrite()
                
                
                
            }
            .padding()
        }
       
        
    }
}

struct _Item:View {
    let title:String
    let name:String
    let image:ImageResource
    let subtitle:String
    let extra:String
    var body: some View {
        VStack(){
           
        
            TextH2(text: title)
            ImageView(
                image:image,
                size: 150
                
            )
            .clipShape(.circle)
            .overlay(Circle().stroke(Color.blue, lineWidth: 1))
            
            
            TextView(
                text: name,
                fontSize: 20,
                fontWeight:.medium
            )
            TextView(
                text: subtitle,
                color:.red, fontSize: 17,
             
            )
            SpacerVertical(8)
            Text(
                extra
            ).lineLimit(nil)
           
            
            
            
        }
    }
}


struct _CopyWrite: View {
    var body: some View {
        VStack{
            
            ImageView(
                image: .justLogo,
                size: 100
            )
            
            TextView(
                text: "© 2024, Jashore University of Science and Technology (JUST)")
            SpacerVertical(4)
            TextView(
                text: "Algorithms Visualizer App")
            SpacerVertical(8)
            TextView(
                text:"Developed in the Department of Computer Science and Engineering(CSE)",
                color: .red
                
            )
        }
    }
}



