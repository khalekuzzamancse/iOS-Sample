
class GenericSamples{

    static func main(){
        sample1()
        print("--")
        sample2()
    }
    
}


fileprivate func sample1(){
    LoginUi(name:"LoginScreen" , childs: [
        ConcreteView{
            print(" Form")
        },
        ConcreteView{
            print(" Login Button")
        },
        
      //  Button() //Not allowed to mix different concreate type
        
    ]).render()
    
}
fileprivate func sample2(){
    // [View] is equivalent to [any View] which erase the concreate type information
    // as result will cause compilation error during passing as child
    let childs: [View] = [
        ConcreteView{
            print(" Form")
        },
        ConcreteView{
            print(" Register Button")
        },
        
    ]
    // LoginUi(name:"RegisterScreen" , childs: childs).render()
    // has concrete type infomation works fine
    let childs2: [ConcreteView] = [
        ConcreteView{
            print(" Form")
        },
        ConcreteView{
            print(" Register Button")
        },
        
    ]
   LoginUi(name:"RegisterScreen" , childs: childs2).render()
    
}


fileprivate class LoginUi<T: View>{
    let name:String
    let childs: Array< T>
    init( name: String, childs: Array<T>) {
        self.name = name
        self.childs = childs
    }
    func render(){
        print(name)
        childs.forEach { (view) in
            view.draw()
        }
    }
    
}

fileprivate class Button: View{
    func draw() {
        print("Button")
    }
}
fileprivate class ConcreteView: View{
    let body: () -> Void
    init(_ body: @escaping () -> Void) {
        self.body = body
    }
    func draw() {
        body()
    }
}

fileprivate protocol View{
     func draw()
}







