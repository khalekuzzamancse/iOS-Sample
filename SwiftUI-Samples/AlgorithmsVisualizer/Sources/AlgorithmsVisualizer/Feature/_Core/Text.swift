
import SwiftUI
import CoreUI
import UIKit

struct TextH1 : View{
    let text:String
    
    var body: some View{
        
        TextView(
            text:text,
            color:Color.blue,
            fontSize: 22,
            
        )
        
        
    }
    
    
}
struct TextH2 : View{
    let text:String
    
    var body: some View{
        
        TextView(
            text:text,
            color:Color.blue,
            fontSize: 20,
            
        )
        
        
    }
    
    
}

struct TextBody1 : View{
    let text:String
    
    var body: some View{
  
        TextView(
            text:text,
            fontSize: 15,
        
            
        )
        
    }
    
    
}



struct TextPoint: View {
    var text: String
    var bulletSize: CGFloat = 8
    
    
    var body: some View {
        let fontSize:CGFloat = 16
        HStack(alignment: .top, spacing: 4) {
            let font = UIFont.systemFont(ofSize: fontSize)
            let lineHeight = font.lineHeight
            let shiftDown = (lineHeight - bulletSize) / 2
            
            Circle()
                .fill(Color.accentColor)
                .size(value:bulletSize)
                .offset(y: shiftDown)
            
                .size(value:bulletSize)
            
            Text(text)
                .font(.system(size: fontSize))
                .foregroundColor(Color.primary)
                .lineSpacing(4) // roughly matches 20.sp line height
                .multilineTextAlignment(.leading)
        }
    }
}


