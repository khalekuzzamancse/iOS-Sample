import Foundation


class FunctioalProgramming{
    
    static func main(){
        functionAsParameter()
        trailingClosure()
        asyncCallback()
        RunLoop.main.run()// Wait to async operation
    }
}

fileprivate func functionAsParameter(){
    _add(2,2,{ result in //Wrong: result->
        print(result)
    })
    _add(2,2, _defaultLogger)
    
}
fileprivate func trailingClosure(){
    _add(3,3){result in
        print(result)
    }
    
}
fileprivate func _defaultLogger(_ log:String){
    print("log is:\(log)")
}

fileprivate func _add(_ a:Int, _ b:Int,_ logger:(String)->Void){
    let result=a+b
    logger("\(result)")
}

fileprivate func asyncCallback(){
    LoginUI {}
}
fileprivate func LoginUI(_ onLoginSuccess:@escaping ()->Void){ // removing "@escaping" leads error
    DispatchQueue.global().asyncAfter(deadline: .now() + 2) { //putted on gloabal to wait the main function
        print("calling: onLoginSuccess() at: \(currentTime())")
        onLoginSuccess()
     }
    print("returning from LoginUI at: \(currentTime())")
}
func currentTime() -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "HH:mm:ss.SSS"
    return formatter.string(from: Date())
}
