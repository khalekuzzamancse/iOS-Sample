
//Wrapping to pretend as java like package

struct DataTypeSamples{
    static func main(){
        typeInfernce()
        typeCast()
        stringInterpolation()

        
    }
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
