import UIKit

//Create an example of demonstrating How to declare optionals in swift?
var name : String?
print(name)
name = "Yagnik"
print("my name is:\(name)")

//What is force unwrapping in optionals show usage in example.
if name != nil {
    let message = "My name is:" + name!
    print(message)
} else {
    print("Name has no value")
}

//Create one example of show usage of optional binding and Create one example using if-let
if let myName = name {
    let message = "My name is:" + myName
    print(message)
}


//Create one example using guard-let
var optionalNumber : Int?
optionalNumber = 10

func Guardfunction(number : Int?) {
    guard let number = number else {
        print("nil value")
        return
    }
    print("It has some value :- \(number)")
}

Guardfunction(number : optionalNumber )


//Create one example using nil colloison operator
let defaultColor = "Black"
var userColor :String?
var chooseColor = userColor ?? defaultColor
print(chooseColor)
userColor = "Red"
chooseColor = userColor ?? defaultColor
print(chooseColor)

