
class CoreNetworkSample{
    
    static func main() {
        Task{
             await read()
        }
        readLine() //Wait for result
       
        
    }
}


fileprivate func read()async{
    let client = NetworkFactory.create()
    do{
     let result = try await client.getOrThrow(url: "https://jsonplaceholder.typicode.com/todos", headers: nil)
    print(result)
    }
    catch{
        print(error)
        
    }
    
}
