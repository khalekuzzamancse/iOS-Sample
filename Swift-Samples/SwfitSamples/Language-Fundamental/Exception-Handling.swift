import Foundation

class ExceptionHandlingSamples {
    
    static func main(){
        tryAsStatment()
        print("---")
        tryAsExpression()
    }
    
}

fileprivate func tryAsExpression() {
// ❌ do-catch cannot be assigned directly
//     let result = do {
//         try _vote("B", 19)
//     } catch {
//         "Failed"
//     }
    //Since can not use as expresion use extra varible
    var result:String? = nil
    do{
      result = try  _vote("B", 17)
        print(result)
    }
    catch{
       result = nil
    }
    print(result)
    
}

fileprivate func fetchUser1() throws{
    do{
        
    }
    catch (let error as Exception) {
        print(error)
    }
    //Since method markes as "throw", fallback "catch" block is optional
//    catch {
//        print(error)
//    }
//    
}


fileprivate func fetchUser2() { //Not marked for throw,
    do{
        
    }
    catch (let error as Exception) {
        print(error)
    }
    //Fallback catch is mandory
    catch {
        print(error)
    }
//
}
fileprivate func tryAsStatment() {
    do{ // "do" instead of "try"
      var result = try  _vote("B", 19)   //"try" before call
        print(result)
      result = try  _vote("B", 17)
        print(result)
    }
    catch{ //Invalid syntax: catch(e:Error)
        print(error) //Implict varaible named "error"
        
    }
    
}

fileprivate func _vote(_ name:String, _ age:Int)throws ->String {

    if(age < 18){
        throw Exception("Illegal Argument"," \(name) age must be greater than 18")
    }
    else{
        return  "Voted by \(name)"
    }
    
}



fileprivate struct Exception:Error{
    let name:String
    let message:String
    init(_ name: String, _ message: String) {
        self.name = name
        self.message = message
    }
    
}
