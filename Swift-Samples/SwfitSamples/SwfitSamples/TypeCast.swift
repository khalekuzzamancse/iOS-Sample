struct TypeCastSamples {
    static func main() {
        upcast()
        safeDowncast()
        forcedDowncast()
        typeCheck()
    }
}

fileprivate func upcast() {
    let dog = Dog()
    let animal = dog as Animal
    print("Upcast successful")
    print("Runtime type: \(type(of: animal))")
    // ❌ Compilation error: Dog and Car are unrelated types.
    // let car = dog as Car
}

fileprivate func safeDowncast() {
    let animal: Animal = Dog()

    let dog = animal as? Dog
    dog?.bark() // Output: Woof!
    let value: Any = Car()
    let invalidDog = value as? Dog
    print("Failed safe cast: \(invalidDog as Any)") // Output: Failed safe cast: nil
}

fileprivate func forcedDowncast() {
    let animal: Animal = Dog()
    let dog = animal as! Dog
    dog.bark() // Output: Woof!
    let value: Any = Car()
    
}

fileprivate func typeCheck() {
    let animal: Animal = Dog()
    let value: Any = Car()

    print("animal is Dog: \(animal is Dog)")// Output: animal is Dog: true
    
    print("value is Dog: \(value is Dog)") // Output: value is Dog: false
}

fileprivate func myCode(){
    librayFunction()
    //Becuase of librayFunction mistake, how to prevent crash me?
}
private func librayFunction(){
    do {
        let x:Any = Car()
        let result=x as! Dog //Line: 2
        print(result)
    } catch {
        //Catch will never executed, if even casting fail
        print(error)
    }
 
    // Invalid typecast of Line:2 causes runtime failure to it  consumer
    // This does not throw any exception so there is no way to catch and prevent
    // the app from crash or terminate, that is why be aware this kind of code
    
}

fileprivate class Car {}

fileprivate class Dog: Animal {
    func bark() {
        print("Woof!")
    }
}

fileprivate class Animal {}
