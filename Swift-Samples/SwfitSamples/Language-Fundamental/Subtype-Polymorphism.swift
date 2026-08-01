import Foundation

class SubtypePolymorphismSamples{
    
    static func main() {
        let choice=Int.random(in: 1...2)
        factory(choice).draw()
        factory2(choice).draw()
        factory3(choice).draw()
        factory4(choice).draw()
    }
}

fileprivate func factory(_ value: Int) -> Shape { // writing "any" is optional
    if (value == 1) {
        return Triangle()
    } else {
        return Rectangle()
    }
}
fileprivate func factory4(_ value: Int) -> any Shape {
    if (value == 1) {
        return Triangle()
    } else {
        return Rectangle()
    }
}
fileprivate func factory2(_ value: Int) -> Shape { // writing "any" is optional
    //Okay as explictly type metioned
    let shape:Shape = (value == 1) ? Triangle() : Rectangle()
    return shape
    //Error: due to type inference, need explict cast
    // return (value == 1) ? Triangle() : Rectangle()

    return (value == 1 ? Triangle() : Rectangle()) as Shape //Valid
}
fileprivate func factory3(_ value: Int) -> some Shape {
    //Unable to figure out the type in compile time that is why
    // causes complation error
//    if (value == 1) {
//        return Triangle()
//    } else {
//        return Rectangle()
//    }
    return Triangle() //Okay, since able to figure the type in complie time
}
fileprivate protocol Shape {
  func draw()
}

fileprivate struct Triangle: Shape {
  func draw() {
    print("Triangle")
  }
}

fileprivate struct Rectangle: Shape {
  func draw() {
    print("Rectangle")
  }
}
