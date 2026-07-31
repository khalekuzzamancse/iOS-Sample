struct NullSafetySamples {
    static func main() {
        optionalDeclaration()
        optionalBinding()
        guardBinding()
        nilCoalescing()
        optionalChaining()
        forceUnwrap()
    }
}

fileprivate func optionalDeclaration() {
    let name: String? = nil
    print(name) // Output: nil
    // ❌ Non-optional String cannot contain nil.
    // let invalidName: String = nil

    // ❌ Optional value must be unwrapped before accessing it.
    // print(name.count)
    // print(name!.count) //Force unwrap, unsafe
    
}

fileprivate func optionalBinding() {
    let name: String? = "Swift"

    if let name { //  if (let name): wrong syntax
        print(name) // Output: Swift
    } else {
        print("Name is missing")
    }
}

fileprivate func guardBinding() {
    printName("Swift")
    printName(nil)
}

fileprivate func printName(_ name: String?) {
    guard let name else {
        print("Name is missing")
        return
    }

    print(name)
}

fileprivate func nilCoalescing() {
    let name: String? = nil
    let displayName = name ?? "Guest"

    print(displayName) // Output: Guest
}

fileprivate func optionalChaining() {
    let user: User? = User(address: Address(city: "Dhaka"))

    print(user?.address?.city ?? "Unknown") // Output: Dhaka

    let missingUser: User? = nil

    print(missingUser?.address?.city ?? "Unknown") // Output: Unknown
}

fileprivate func forceUnwrap() {
    let name: String? = "Swift"

    print(name!) // Output: Swift

    let missingName: String? = nil

    // ❌ Force-unwrapping nil terminates the process.
    // It does not throw an Error and cannot be caught.
    // print(missingName!)
}

fileprivate struct User {
    let address: Address?
}

fileprivate struct Address {
    let city: String
}
