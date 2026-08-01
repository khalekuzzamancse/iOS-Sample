
class AssociatedTypeSamples{
    
    static func main() {
        sample1()
    }
}

fileprivate func sample1() {
    TextField {
        print("Login-Form")
    }
    Button(body: "Login-Button")
   
    
}


fileprivate struct Button: View {
    typealias body = String
    let body: String
    init (body: String) {
        self.body = body
        print(body)
    }
}

fileprivate struct TextField: View {
    typealias body = ()->Void
    init (body: ()->Void) {
        body()
    }

}

fileprivate protocol View{
    associatedtype body
}
