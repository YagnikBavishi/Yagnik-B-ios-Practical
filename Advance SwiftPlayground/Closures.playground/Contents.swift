import UIKit

var hellomessage = { (name: String) in
  print("Hello,\(name)")
}

hellomessage("Yagnik")
print()

// closure with return type
var findSquare = {
    (number: Int) -> (Int) in
    let square = number * number
  return square
}

var result = findSquare(3)
print("Square:",result)
print()

// closure as fuction parameter
func greeting(hello: ()->()) {
    print("How are you??")
    // closure call
    hello()
}

greeting(hello: {
   print("I`m Fine!!")
})
print()

//closure with function parameter and also clousure with paramter
func greetingwithClosurePara(hello: (_ name: String)->()) {
    print("How are you??")
    // closure call
    hello("Yganik")
}

greetingwithClosurePara(hello: {name in
    print("I`m Fine!!")
    print("Hello my name is \(name)")

})
print()

func greeting1(hello: (_ name: String) -> (String)) {
    print("How are you??")
    print(hello("Yagnik"))
}

greeting1(hello: {name in
    print("I`m Fine!!\(name)")
    return "Bavishi"
    
})
print()

//trailing closure
//Noramal Clousure
func myFuction(myClosure:() -> Void) {
    myClosure()
}

myFuction(myClosure: {
    print("Inside the closure..")
})

//trailing closure
func trailingClosure(myClosure: (_ name: String) -> Void) {
    myClosure("Yagnik")
}

trailingClosure() { name in
    print("Inside the Trailing Closure..")
    print("My name is \(name)")
}
print()

//Capturing Values
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    
    func incrementer() -> Int {
        runningTotal = runningTotal + amount
        return runningTotal
    }
    
    return incrementer
}
let number = makeIncrementer(forIncrement: 20)
print("\(number())")
print("\(number())")
let number2 = makeIncrementer(forIncrement: 10)
print("\(number2())")
print("\(number2())")
print("\(number())")

let alsoIncrementByTwenty = number
print("\(alsoIncrementByTwenty())")

print()

//Capturing Values with return type
func makeIncrementerwittParameter(forIncrement amount: Int) -> (_ name: String) -> Int {
    var runningTotal = 0
    
    func incrementer(name: String) -> Int {
        print("Hello,\(name)")
        runningTotal = runningTotal + amount
        return runningTotal
    }
    
    return incrementer
}
let numberwithString = makeIncrementerwittParameter(forIncrement: 20)
print("\(numberwithString("Yagnik"))")
print()

// second example of Capturing values
var index = 0
var closureArray = [()->()]()
for _ in 1...5 {
    closureArray.append { [index] in
        print(index)
    }
    index = index + 1
}
closureArray[0]()
closureArray[1]()
closureArray[2]()
closureArray[3]()
closureArray[4]()


//nonEscapingClosure..
func nonEscapingClosureFunction(nonEscapingClosure:() -> ()) {
    print("inside the function")
    nonEscapingClosure()
}

nonEscapingClosureFunction(nonEscapingClosure: {
    print("Hello form closure..")
})
print()

//EscapingClosure..
var complitionHandler: [() -> ()] = []
func escapingClosureFunction(escapingClosure: @escaping () -> ()) {
    print("inside the function")
    complitionHandler.append(escapingClosure)
}

func callClosurewithNoParameter() {
    complitionHandler
}

escapingClosureFunction(escapingClosure: {
    print("Hello form closure..")
})
callClosurewithNoParameter()
print()


var complitionHandlerwithParameter: ((String) -> ())?
func escapingClosureFunction(escapingClosure: @escaping (_ name: String) -> ()) {
    print("inside the function")
    complitionHandlerwithParameter = escapingClosure
}

func callClosure(){
    complitionHandlerwithParameter?("Yagnik")
}

escapingClosureFunction(escapingClosure: { name in
    print("Hello form closure..")
    print("Name:\(name)")
})
callClosure()
print()


//autoclosure
func display(greet: @autoclosure () -> ()) {
    greet()
}
// pass closure without {}
display(greet: print("hello"))




