import Foundation

class EqualitySamples{
    
    static func main(){
        sample1()
        sample2()
        hashAbleSample()
        toStringSamples()
    }
    
}

fileprivate func sample1(){
    let a=Student("ab")
    let b=Student("ab")
    let c=b
    print(a === b) //Refernce check
    print(b === c)

  // '==' or "!=" cannot be applied as does not conform Equatable
  // var isEqual=(a==b); ❌
  // var isEqual = (a != b); ❌
    
}
fileprivate func sample2(){
    let a=Person("ab")
    let b=Person("ab")
    let c=Person("xy")
    print(a==b)
    print(a==c)
    print(b != c )
    
}
fileprivate func hashAbleSample(){
    var items:Set<AnyHashable> = []
    items.insert(School("abc"))
    items.insert(School("xyz"))
   // items.insert(Person("a"))/Error: Person does not confrom Hashable
    print(items.count)
  
}

fileprivate class School:Hashable{
    let name: String
    init(_ name: String) {
        self.name = name
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

fileprivate class Student{
    let name: String
    init(_ name: String) {
        self.name = name
    }
    
}
fileprivate class Person:Equatable{
    let name: String
    init(_ name: String) {
        self.name = name
    }
    
    static func == (lhs: Person,rhs: Person) -> Bool {
          return lhs.name == rhs.name
    }
    
}
fileprivate func toStringSamples(){
    let a=Boy("a",10)
    let b=Boy("b",10)
    print("\(a)")
    print("\(b)")
    
}
fileprivate class Boy:CustomStringConvertible{
    let name: String
    let age: Int
    init (_ name: String, _ age: Int) {
        self.name = name
        self.age = age
    }
    
    var description: String {
        return "Boy(name: \(name), age: \(age))"
    }
    
    
}
