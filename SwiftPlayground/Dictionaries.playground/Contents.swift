import UIKit

//1.
var code = [
    "a" : "b",
    "b" : "c",
    "c" : "d",
    "d" : "e",
    "e" : "f",
    "f" : "g",
    "g" : "h",
    "h" : "i",
    "i" : "j",
    "j" : "k",
    "k" : "l",
    "l" : "m",
    "m" : "n",
    "n" : "o",
    "o" : "p",
    "p" : "q",
    "q" : "r",
    "r" : "s",
    "s" : "t",
    "t" : "u",
    "u" : "v",
    "v" : "w",
    "w" : "x",
    "x" : "y",
    "y" : "z",
    "z" : "a"
]
var encodedMessage = "uijt nfttbhf jt ibse up sfbe"
var result = String()
for index in encodedMessage {
    if index == " "{
        result = result + String(index)
    }
    
    for (key,value) in code {
        if(String(index) == value) {
            result = result + key
        }
    }
}

print(result)
print()


//2.
var people: [[String:String]] = [
[
    "firstName": "Calvin",
    "lastName": "Newton"
    ],
    [
    "firstName": "Garry",
    "lastName": "Mckenzie"
    ],
    [
    "firstName": "Leah",
    "lastName": "Rivera"
    ],
    [
    "firstName": "Sonja",
    "lastName": "Moreno"
    ],
    [
    "firstName": "Noel",
    "lastName": "Bowen"
    ]
]
var firstName = [String]()

for dictonary in people{
    if let name = dictonary["firstName"] {
        firstName = firstName + [name]
    }
}

print(firstName)
print()


//3.
var fullName = [String]()

for dictonary in people{
    if let firstname = dictonary["firstName"] {
        if let lastName = dictonary["lastName"] {
        fullName = fullName + ["\(firstname) \(lastName)"]
        }
    }
}

print(fullName)
print()


//4.
var people4: [[String:String]] = [
[
    "firstName": "Calvin",
    "lastName": "Newton",
    "score": "13"
    ],
    [
    "firstName": "Garry",
    "lastName": "Mckenzie",
    "score": "12"
    ],
    [
    "firstName": "Leah",
    "lastName": "Rivera",
    "score": "10"
    ],
    [
    "firstName": "Sonja",
    "lastName": "Moreno",
    "score": "3"
    ],
    [
    "firstName": "Noel",
    "lastName": "Bowen",
    "score": "16"
    ]
]

var value = [Int]()

for person in people4 {
    if let scores = person["score"] {
    value = value + [Int(scores)!]
    }
}

var lowValue = value.firstIndex(of: value.min()!)

if let firstnameLowScore = people4[lowValue!]["firstName"] {
    print(firstnameLowScore , terminator: " ")
}

if let lastnameLowScore = people4[lowValue!]["lastName"] {
    print(lastnameLowScore)
}
print()


//5.
var sortedValue = Array(value.sorted().reversed())
for index in 0...sortedValue.count-1 {
    let dictIndex = value.firstIndex(of: sortedValue[index])
    if let firstnameLowScore = people4[dictIndex!]["firstName"] {
        print(index + 1, "." ,firstnameLowScore , terminator: " ")
    }
    
    if let lastnameLowScore = people4[dictIndex!]["lastName"] {
        print(lastnameLowScore, terminator: " ")
    }
    
    if let scoreLow = people4[dictIndex!]["score"] {
        print("-", scoreLow)
    }
}
print()


//6.
var numbers = [1, 2, 3, 2, 3, 5, 2, 1, 3, 4, 2, 2, 2]
var output: [Int: Int] = [:]
var frequncy: [Int : Int] = [:]
numbers.sort()
var compare = numbers[0]
var counter = 0

for index in numbers {
    if index == compare {
        counter = counter + 1
        output[index] = counter
    } else {
        compare = index
        counter = 1
        output[index] = counter
    }
}

var sortedKeys = Array(output.keys).sorted()
let keys = output.keys.sorted()

for key in keys {
    if let value = output[key] {
        print("\(key): \(value)")
    }
}

