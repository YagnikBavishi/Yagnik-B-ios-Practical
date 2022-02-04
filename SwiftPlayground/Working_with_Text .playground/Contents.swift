import UIKit

var string = "Simform"
//1.
if string.count > 2 {
    print(string.prefix(2))
} else {
    print(string)
}


//2.
if string.count > 2 {
    string.removeFirst()
    string.removeLast()
    print(string)
} else {
    print(string)
}


//3.
var string2 = "Example"
string.removeFirst()
string2.removeFirst()
print(string + string2)


//4.
let firstChar = string.removeFirst()
let secondChar = string.removeFirst()
string.insert(firstChar , at: string.endIndex)
string.insert(secondChar , at: string.endIndex)
print(string)

//5.
if string.prefix(2) == "Sw" {
        print(true)
} else {
    print(false)
}

//6.
var firstThreeCharacter = string.prefix(3)
var lastThreeCharacter = string.suffix(3)
print(firstThreeCharacter + lastThreeCharacter)

//7.
var name = "Yagnik"
var message = "Welcome , \(name)!"
print(message)
name = "Yagnik Bavishi"
let firstSpace = name.firstIndex(of: " ") ?? name.endIndex
let firstName = name[..<firstSpace]
print(firstName)
print(Array(name))
print(strlen(name))
let counter = "a"
print(counter.count)
let empty = " "
print(empty)
let emptyString = String()

if let i = name.firstIndex(of: "a") {
    name.remove(at: i)
}

print(name)
name.removeLast()
print(name)
print(name.uppercased())
print(name.prefix(5))
print(name.suffix(6))
print(name.sorted())
