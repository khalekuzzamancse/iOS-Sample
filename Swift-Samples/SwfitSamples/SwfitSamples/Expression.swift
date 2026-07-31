//Wrapping to pretend as java like package

struct ExpressioSamples{
    static func main(){
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

