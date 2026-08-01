import Foundation

class ManualSerializationSamples{
    
    static func main() {
        sample1()
    }
    
    
    
}


fileprivate func sample1(){
    let response = json
    do {
        let data = Data(response.utf8)

        let jsonObject = try JSONSerialization.jsonObject(with: data)
        
        //Must aware of response format, otherwise cast fails
        guard let jsonArray = ( jsonObject as? [[String: Any]] ) else {
          return
        }
        print(jsonArray.count)
        
      try  jsonArray.forEach{ item in
           try _parseOrThrow(item)
        }
        
    }
    catch {
        
    }
    
}

fileprivate func _parseOrThrow(_ item:[String: Any]) throws{
    let name = item["title"] as? String
    print("Item: \(name ?? "")")
    
}



fileprivate let json = """
[
  {
    "userId": 1,
    "id": 1,
    "title": "delectus aut autem",
    "completed": false
  },
  {
    "userId": 1,
    "id": 2,
    "title": "quis ut nam facilis et officia qui",
    "completed": false
  },
  {
    "userId": 1,
    "id": 3,
    "title": "fugiat veniam minus",
    "completed": false
  }
]
"""
