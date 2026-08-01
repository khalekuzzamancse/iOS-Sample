import Foundation
class AutomaticSerializationSamples{
    
    static func main() {
        sample1()
        sample2()
    }
}



fileprivate func sample1(){
    let response=json
    do{
        let todos = try JSONDecoder().decode([Todo].self,from: Data(response.utf8))
        print(todos.count)
    }
    catch{
        print(error)
    }
   
}
fileprivate func sample2(){
    let response=json
    do{
        let todos = try JSONDecoder().decode([TodoModel].self,from: Data(response.utf8))
        print(todos.count)
    }
    catch{
        print(error)
    }
   
}


fileprivate struct TodoModel: Codable {
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool

    // Local/transient property — not present in JSON
    var isSelected: Bool = false

    enum CodingKeys: String, CodingKey {
        case userId = "user_id"
        case id
        case title
        case completed
        // Do not add isSelected here
    }
}

fileprivate struct Todo: Codable {
    let user_id: Int
    let id: Int
    let title: String
    let completed: Bool
}

fileprivate let json = """
[
  {
    "user_id": 1,
    "id": 1,
    "title": "delectus aut autem",
    "completed": false
  },
  {
    "user_id": 1,
    "id": 2,
    "title": "quis ut nam facilis et officia qui",
    "completed": false
  },
  {
    "user_id": 1,
    "id": 3,
    "title": "fugiat veniam minus",
    "completed": false
  }
]
"""
