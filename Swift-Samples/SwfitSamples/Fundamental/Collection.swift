

class CollectionSamples{
    
    static func main(){
        arraySamples()
        print("----")
        setSamples()
        print("----")
        dictSamples()
        print("----")
        tupleSamples()
    }
    
}


fileprivate func arraySamples(){
    
    var persons: Array<Person> = [] // using "let" will prevent mutation
    persons.append(Person("a", 1))
    persons.append(Person( "b",2))
    persons[0]=Person("c",3)
    print(persons.count)
    print(persons[0].name)
    let names:Array<String> = persons.map {person in person.name }
    print("names:\(names)")
    let items=persons.filter{ person in
        person.age >= 0
        
    }
    print(items.count)
    
}
fileprivate func setSamples(){
    
    var schools: Set<School> = [] // using "let" will prevent mutation
    schools.insert(School("a", 1))
    schools.insert(School( "b",2))
    schools.insert(School( "b",2))
    print(schools.count)
    let names:Array<String> = schools.map {person in person.name }
    print("names:\(names)")
    let items=schools.filter{ school in
        school.teachers > 1
        
    }
    print(items.count)
    
}
fileprivate func dictSamples(){
    
    var persons:Dictionary<String, Int> = [:] // Only [ ] is invalid
    persons["a"]=1
    persons["b"]=2
    persons["a"]=3
    print(persons.count) //Output: 2
    let names:Array<String> = persons.map {(name,age) in name  }
    print("name:\(names)") //Output:
    let items=persons.filter{ (name, age) in
        age >= 3
        
    }
    print(items.count)//Output:1
}

fileprivate func tupleSamples(){
    
    let t1: (String, Int) = ("a", 1)
    let t2: (String, Int, Int) = ("b", 1, 2)
    let t3: (String, Int, Int, Int) = ("c", 1, 2, 3)
    print("\(t1.0), \(t2.0), \(t3.0)")
    
    
    
    
}

fileprivate struct Person{
    let name: String
    let age: Int
    init(_ name: String, _ age: Int) {
        self.name = name
        self.age = age
    }
    
}

fileprivate class School:Hashable{
    let name: String
    let teachers:Int
    init(_ name: String, _ teachers:Int) {
        self.name = name
        self.teachers = teachers
    }
   
    //Hashable conform Equatable so mandtory to implement the == operator
    static func == (lhs: School,rhs: School) -> Bool {
          return lhs.name == rhs.name
    }
    //Mandtory
    func hash(into hasher: inout Hasher) {
          hasher.combine(name)
      }
}

