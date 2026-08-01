struct IterationSamples {
    static func main() {
        rangeLoop()
        collectionLoop()
        whileLoop()
        repeatWhileLoop()
        breakAndContinue()
        strideLoop()
    }
}

fileprivate func rangeLoop() {
    for number in (1...3) { //Allowed to wrap only the sequence expression
        print(number)
    }
    for number in 1...3 { // for (number in 1...3) : wrong syntax
        print(number)
    }
    // Output: 1, 2, 3
    for number in 1..<3 {
        print(number)
    }
    // Output: 1, 2
    
    /* Syntax:
     for pattern in sequence {
       body
     }
     pattern: is statement not expr that is can not use () for wrap
     body: a block
     */
    
}




fileprivate func collectionLoop() {
    let names = ["Alice", "Bob"]

    for (index, name) in names.enumerated() {
        print("\(index): \(name)")
    }

     for (name) in names {
         print(name)
     }
    for name in names {
        print(name)
    }
    
    /* Wrong:
     for (name in names) {
         print("\(name)")
     }
     */
    
}

fileprivate func whileLoop() {
    var number = 1

    while (number <= 3) {
        print(number)
        number += 1
    }
}

fileprivate func repeatWhileLoop() {
    var number = 5
    //Indentical to do-while loop

    repeat {
        print(number) // Output: 5
        number += 1
    } while (number < 3)
    // repeat-while always executes at least once.
}
fileprivate func repeatN(_ n:Int, _ body: () -> Void){
    // No built in repeat(n){} syntax available
    
    for _ in 0..<n {
       body()
    }
}

fileprivate func breakAndContinue() {
    for number in 1...5 {
        if(number == 2) {
            continue
        }

        if (number == 5) {
            break
        }

        print(number)
    }
    // Output: 1, 3, 4
}

fileprivate func strideLoop() {
    for number in stride(from: 5, through: 1, by: -1) {
        print(number)
    }
    // Output: 5, 4, 3, 2, 1

    // ❌ A reversed closed range causes a runtime failure.
    // for number in 5...1 { }

    // ❌ Swift does not support the old C-style for loop.
    // for (var i = 0; i < 3; i++) { }
}
