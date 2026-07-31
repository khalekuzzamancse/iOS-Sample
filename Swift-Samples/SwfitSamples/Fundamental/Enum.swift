import Foundation

class EnumSamples{
    
    static func main(){
        sample1()
        sample2()
    }
    
}

fileprivate func sample1(){
    print(LoginState.error)
    
}
fileprivate func sample2(){
    print(HTTPResponse.success(json: "Hello, Enum"))
    
}

fileprivate enum HTTPResponse{
    // let status: Int //:Error can not have stored propery
    case success(json:String)
    case failure(status: Int, message: String)
}
fileprivate enum LoginState{
    // In single line separated by comma with single "case" keyword
    case loggedIn, loggedOut
    case error
    case success
}
