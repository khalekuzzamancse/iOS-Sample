import Foundation

class DataRaceSamples{
    
    static func main(){
        sample2()
        readLine() //wait..
        
    }
}



fileprivate func sample1() {
    let counter = Counter()
    // Run multiple time and see the log
    // How it causes races
    
    Task.detached {
        for _ in 1...20 {
            print("[\(time())] Task-1: \(counter.increment())")
            
        }
    }
    Task.detached {
        for _ in 1...20 {
            print("[\(time())] Task-2: \(counter.increment())")
            
        }
    }
}
fileprivate func sample2() {
    let counter = Counter()
    // Run multiple time and see the log
    // How it causes races
    
    for i in 1...20 {
        Task.detached {
            print("[\(time())] Task-1-\(i): \(counter.increment())")
        }
        Task.detached {
            print("[\(time())] Task-2:-\(i): \(counter.increment())")
        }
    }
    
}

fileprivate func time() -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "mm:ss.SSS"
    return formatter.string(from: Date())
}


fileprivate class Counter {
    var value = 0
    //Not a thread safe data strcuture because there is
    //possibility of data race, as two thread access them concurrently
    // with at least one is the right operation
    func increment() -> Int {
        value = value + 1
        return value
    }
}

