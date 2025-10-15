//
//  Register.swift
//  SwiftUIConcept
//
//  Created by Md Khalekuzzaman on 10/15/25.
//



import SwiftUI
import CoreUI
public struct SearchInputScreen:View{
    @State private var array = ""
    @State private var target = ""
    @State private var showSheet=false
    public init(){}
    private let features=[
        "Input the array elements separated by space or comma",
        "Enter the target number you are searching for",
        "Click 'Start Visualization' to begin"
        
    ]
    
    public var body: some View{
        
        
        VStack(
           
        ){
            TextFieldView(
                value: $array,
                hints: "array",
                leadingIcon:{
                    Image(systemName: "list.dash")
                        .font(.system(size: 20))
                        .foregroundColor(.blue)
                },
                onValueChange: { _ in
                    self.array=array.filter { $0.isNumber || $0.isWhitespace || $0 == ","}
                }
                
            )
            SpacerVertical(height: 16)
            TextFieldView(
                value: $target,
                hints: "target",
                leadingIcon:{
                    Image(systemName: "text.magnifyingglass")
                        .font(.system(size: 20))
                        .foregroundColor(.blue)
                },
                onValueChange: { _ in
                     self.target=target.filter { $0.isNumber }
                }
                
            )
            SpacerVertical(height: 32)
            ButtonViewSolid(
                label:"Start Visualizaton",
                shape:AnyView(RoundedRectangle(cornerRadius:10)),
                paddingHorizontal: 8,
                paddingVertical: 8,
                fontSize:25,
                minWidth:250,
                onClick: {}
            )
            SpacerVertical(height: 64)
            ForEach(features,id:\.self){feature in
                TextPoint(text:feature).fillMaxWidth(alignment: .leading)
            }
            
            SpacerVertical(height: 32)
            TextH1(text: "Instruction")
                .fillMaxWidth(alignment: .topLeading)
            
            _Instrcution()
        }.padding()
            .fillMaxHeight(alignment: .topLeading)
      
     
        
        
    }
    
}

struct _Instrcution: View {
    var body: some View {
        VStack{
            
            _InstrcutionItem(
                icon:"arrowtriangle.right",
                instruciton: "Next Step"
            )
            _InstrcutionItem(
                icon:"chevron.left.forwardslash.chevron.right",
                instruciton: "Pseudocode visualization"
            )
            _InstrcutionItem(
                icon:"arrow.trianglehead.clockwise.rotate.90",
                instruciton:"Reset and start from beginning"
            )
            _InstrcutionItem(
                icon:"clock",
                instruciton: "Auto play"
            )
        }
    }
}


struct _InstrcutionItem: View {
    let icon:String
    let instruciton:String
    var body: some View {
        HStack{
            IconView(icon: icon, size: 30)
            TextView(text: instruciton)
        }.fillMaxWidth(alignment: .leading)
    }
}

#Preview {
    SearchInputScreen()
}
