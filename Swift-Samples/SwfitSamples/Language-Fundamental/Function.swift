import Foundation

struct FunctionFoundationSamples {
    static func main() {
        requiredArgumentLabel()
        customArgumentLabel()
        omittedArgumentLabel()
        defaultParameter()
        returnValue()
        functionOverloading()
        variadicParameter()
        inoutParameter()
    }
}

fileprivate func requiredArgumentLabel() {
    greet(person: "Md")
    // Output: Hello, Md!

    // ❌ The argument label `person` is mandatory.
    // greet("Md")
}

fileprivate func customArgumentLabel() {
    welcome(to: "Md")
    // Output: Welcome, Md!

    // ❌ `to` is the external argument label.
    // welcome(person: "Md")
}

fileprivate func omittedArgumentLabel() {
    sayHello("Md")
    // Output: Hello, Md!

    // ❌ `_` removes the argument label.
    // sayHello(person: "Md")
}

fileprivate func defaultParameter() {
    printGreeting(2)
    // Output:
    // Hello, N/A!
    // Hello, N/A!

    printGreeting(1, person: "MK")
    // Output: Hello, MK!

    // ❌ `count` has no default value, so it is mandatory.
    // printGreeting(person: "MK")
}

fileprivate func returnValue() {
    let result = add(2, 3)
    print(result) // Output: 5
}

fileprivate func functionOverloading() {
    describe(10)      // Output: Integer: 10
    describe("Swift") // Output: String: Swift
}

fileprivate func variadicParameter() {
    let result = sum(1, 2, 3, 4)
    print(result) // Output: 10

    print(sum()) // Output: 0
}

fileprivate func inoutParameter() {
    var number = 10

    increment(&number)
    print(number) // Output: 11

    // ❌ An inout argument must use `&`.
    // increment(number)

    // ❌ Constants cannot be passed as inout arguments.
    // let value = 10
    // increment(&value)
}

fileprivate func greet(person: String) {
    print("Hello, \(person)!")
}

fileprivate func welcome(to person: String) {
    print("Welcome, \(person)!")
}

fileprivate func sayHello(_ person: String) {
    print("Hello, \(person)!")
}

fileprivate func printGreeting(
    _ count: Int,
    person: String = "N/A"
) {
    for _ in 0..<count {
        print("Hello, \(person)!")
    }
}

fileprivate func add(
    _ first: Int,
    _ second: Int
) -> Int {
    return first + second
}

fileprivate func describe(_ value: Int) {
    print("Integer: \(value)")
}

fileprivate func describe(_ value: String) {
    print("String: \(value)")
}

fileprivate func sum(_ numbers: Int...) -> Int {
    var result = 0

    for number in numbers {
        result += number
    }

    return result
}

fileprivate func increment(_ number: inout Int) {
    number += 1
}
