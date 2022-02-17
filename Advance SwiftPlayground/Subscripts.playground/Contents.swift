import UIKit

//13.Create one example of subscript using array. Create one array of weekdays and one subscript func which takes int as argument and returns day of week.
struct Week {
    var days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    subscript(index: Int) -> String {
        return days[index]
    }
}
let weekDays = Week()
print("Day at gievn position:- \(weekDays[5])")
print()

//14.Create a swift program to show usage of subscript in string. I pass int argument and it returns the character at given position.

struct StringSubscript {
    var string = "Yagnik Bavishi"
    subscript(index: Int) -> Character {
        return ([Character](string))[index - 1]
    }
}
let StringSubscriptOpbject = StringSubscript()
print("Character At gievn positions is:- \(StringSubscriptOpbject[10])")
print()

//15.Create one swift subscript program which takes range as input and returns the string between the ranges.

struct RangeSubscript {
    let string = "Yagnik Bavishi"
    subscript(startIndex: Int, endIndex: Int) -> String {
        var newString = ""
        if startIndex >= 1 && endIndex <= string.count {
            for index in startIndex...endIndex {
                newString = newString + String([Character](string)[index - 1])
            }
        }
        return newString
    }
}
let rangeSubcriptObject = RangeSubscript()
print("Charcater in between given Range is:- \(rangeSubcriptObject[3,8])")
print()

//16.I have one integer array and create one function which takes range as input and returns all elements between the range.

struct RnageinArraySubscript {
    var array = [4, 6, 2, 8, 9, 10]
    subscript(startIndexOfArray: Int, endIndexOfArray: Int) -> [Int] {
        var newArray:[Int] = []
        if startIndexOfArray >= 1 && endIndexOfArray <= array.count {
            for index in startIndexOfArray...endIndexOfArray {
                newArray.append(array[index - 1])
            }
        }
        return newArray
    }
}
let rangeArraySubcriptObject = RnageinArraySubscript()
print("Array element in given range:- \(rangeArraySubcriptObject[1,4])")
print()

//17.I have one key value pair array. Create one function using subscript which takes key as input and returns it’s value.

struct DictionarySubscript {
    var dictionary = [1: "Hello", 2: "Hi", 3: "Hey"]
    subscript(key: Int) -> String {
        if let value = dictionary[key] {
            return value
        }
        else {
            return "Nil"
        }
    }
}
var objectOfDictionarySubscript = DictionarySubscript()
print("Value at given Index:- \(objectOfDictionarySubscript[1])")
print()

//18. Create one array of type Person and create one subscript function which takes person name as input and returns person info like name, age, birthdate etc.
class Person {
    var nameofPerson: String
    var ageofPerson: Int
    var birthDateofPerson: String
    var allObjectOfPerson: [Person] = []
    
    init(name: String, age: Int, birthDate: String) {
        nameofPerson = name
        ageofPerson = age
        birthDateofPerson = birthDate
    }
    
    subscript(nameofPerson: String) -> Person? {
        for person in allObjectOfPerson {
            if person.nameofPerson == nameofPerson{
                return person
            }
        }
        return nil
    }
}

var allPersonData: [Person] = []
allPersonData.append(Person(name: "Yagnik", age: 21, birthDate: "04/07/2001"))
allPersonData.append(Person(name: "Jay", age: 21, birthDate: "01/01/2001"))
var objectOfPerson = Person(name: "", age: 0, birthDate: "")
objectOfPerson.allObjectOfPerson = allPersonData
if let personame = objectOfPerson["Jay"] {
    print("Name: \(personame.nameofPerson), Age: \(personame.ageofPerson), birthdate: \(personame.birthDateofPerson)")
}
print()

//Type Subscript
enum Color: Int {
    case red = 1, black, white, blue
    static subscript(n: Int) -> Color? {
        return Color(rawValue: n)
    }
}
let color = Color[5]
print(color ?? "Out of range..")
