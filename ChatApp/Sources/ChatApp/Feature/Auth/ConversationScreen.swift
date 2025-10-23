import SwiftUI
import CoreUI

struct ConversationScreen: View {
   
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    ForEach((conversations+conversations+conversations),id: \.username){model in
                        _Item(model: model)
                        
                    }
                    
                }.padding()
                
                
            }
            .toolbar {
                // Right side button
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                      
                    }) {
                        Image(systemName: "magnifyingglass")
                    }
                }
                
            
            }
        }
      
     
        
    }
    
    let conversations: [ConversationModel] = [
        ConversationModel(
            username: "Alice",
            image: "https://avatars.githubusercontent.com/u/74848657?v=4",
            lastMessage: LastMessageModel(
                msgLabel: "Hey, how are you?",
                timeStamp: "10:25 AM",
                status: 3
            )
        ),
        ConversationModel(
            username: "Bob",
            image: "https://avatars.githubusercontent.com/u/155247139?v=4",
            lastMessage: LastMessageModel(
                msgLabel: "Let’s meet tomorrow!",
                timeStamp: "Yesterday",
                status: 1
            )
        ),
        ConversationModel(
            username: "Charlie",
            image: "https://avatars.githubusercontent.com/u/81219862?v=4",
            lastMessage: LastMessageModel(
                msgLabel: "See you soon!",
                timeStamp: "Mon",
                status: 2
            )
        ),
        ConversationModel(
            username: "Diana",
            image: "https://avatars.githubusercontent.com/u/120084489?v=4",
            lastMessage: LastMessageModel(
                msgLabel: "Got it!",
                timeStamp: "11:42 PM",
                status: 1
            )
        ),
        ConversationModel(
            username: "Eve",
            image: "https://avatars.githubusercontent.com/u/86280394?v=4",
            lastMessage: nil
        )
    ]

}

#Preview {
    ConversationScreen()
}
struct ConversationModel{
    let username:String
    let image:String
    let lastMessage:LastMessageModel?
    
}
struct LastMessageModel{
    let msgLabel:String
    let timeStamp:String
    let status:Int
}

private struct _Item: View {
    let model:ConversationModel
    var body: some View {
        HStack{
            _Image(
                url: model.image
            )
            VStack{
                TextView(
                    text: model.username,
                    fontSize: 20
                )
                    .fillMaxWidth(alignment: .leading)
                _lastMsg
            }
            
        }
        .padding(8)
        .overlay(
              RoundedRectangle(cornerRadius: 8)
                  .stroke(Color.gray, lineWidth: 1)
          )
        .clipShape(RoundedRectangle(cornerRadius: 8))
     
    }
    
    @ViewBuilder var _lastMsg: some View{
        if let lastMsg = model.lastMessage{
            
              HStack(
                spacing: 0,
              ){
                  TextView(
                    text: lastMsg.msgLabel,
                    color:((lastMsg.status <= 2) ? Color.black : Color.gray)
                    
                  )
                  Spacer()
                  _statusIcon
                  TextView(
                    text: lastMsg.timeStamp,
                    color: .gray
                  )
                  
              }
              .fillMaxWidth(alignment: .leading)
            
          }
        if(model.lastMessage == nil){
            TextView(text: "Say something to start a conversation")
                .fillMaxWidth(alignment: .leading)
        }
            
        
    }
    @ViewBuilder var _statusIcon:some View{
        if let lastMsg = model.lastMessage{

            switch lastMsg.status {
            case 3://seen
                HStack(
                    spacing: 0,
                ){
                    IconView(icon: "checkmark", size:12,tint: .green)
                    IconView(icon: "checkmark", size:12,tint: .green)
                }
                
            default:
                HStack(
                    spacing: 0,
                ){
                    IconView(icon: "checkmark", size:12,tint: .gray)
                    IconView(icon: "checkmark", size:12,tint: .gray)
                }
            }
            
          }
    }
}


struct _Image: View {
     let url:String
    private let imageSize:CGFloat=48
    private let iconSize:CGFloat=10


    
    var body: some View {
        
        
        ZStack{
            AsyncImage(url: URL(string:url)) { phase in
                switch phase {
                case .empty:
                    ProgressView() // Loading state
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                case .failure:
                    Image(systemName: "photo") // Placeholder for failure
                @unknown default:
                    EmptyView()
                }
            }
            .clipShape(Circle())
            .size(imageSize)
            ZStack{
                ZStack{
                    Color.green
                }
                .clipShape(Circle())
                .size(iconSize)
            }
            .background(
                RoundedRectShape(radius: iconSize/2,color:Color.yellow))
            
            .position(x: imageSize, y: imageSize/2)
        }.size(value: imageSize)
           
        
        
        
        
    }
}
