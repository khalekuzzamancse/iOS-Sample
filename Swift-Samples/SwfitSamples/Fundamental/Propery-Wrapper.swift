import Foundation

class PropertyWrapperSamples{
    
    static func main() {
        sample1()
    }
}

fileprivate func sample1() {
    @State var count: Int
    print(count)
    count = 2
    print(count)
}

@propertyWrapper
fileprivate struct State {
    // Propetry has not stored here instead manage in other storgae
    var wrappedValue: Int {
        get {
            PersistantStorage.count
        }

        nonmutating set {
            PersistantStorage.count = newValue
        }
    }
}

fileprivate class PersistantStorage {
    static var count:Int = 1
}

