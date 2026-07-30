
//Wrapping to pretend as java like package

struct DataTypeSamples{
    static func main(){
        typeInfernce()
        typeCast()
        stringInterpolation()
        ifExpression()
        switchExpression()
        
    }
}

fileprivate func switchExpression(){
    let x=10
   let result = switch(x){
   case 10: "ten";
   default : "other"
    }
    print(result)
}

fileprivate func ifExpression(){
    let x=10
    let result = if(x%2==0) {"even"} else {"odd"}
    print(result)
    //❌: Mandtory to wrap by block to use as expression
    // let result=if(x%2==0) "even" else "odd"
    
}

fileprivate func stringInterpolation(){
    let age=24
    print("age: \(age)")
}

fileprivate func typeCast(){
    let x=add(2,2.5)
    let y:Int=Int(x)
    print(y)
    
}
fileprivate func typeInfernce(){
    add(2.0,3) //✅: Type inferncei for literal
    // let x=2 //❌: x is inferenced as Int
    //add(x,3.0)
    let x:Double=2
    add(x, 5) //✅
}
fileprivate func add(_ a:Double, _ b:Double)->Double{
    let sum=a+b
    print(sum)
    return sum
}
