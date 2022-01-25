import UIKit

//1.Create an example using swift to demonstrate use of get only properties. Create a class with a property which value cannot be set outside of class.
class Demo {
    var name: String = ""
}
//name = "Yagnik"
let objectDemo = Demo()
objectDemo.name = "Yagnik"
print(objectDemo.name)

//2.Create a swift program to demonstrate usage of computed properties using getter and setter.

struct Circle {
    var redius: Double = 0
    var area: Double {
        get {
            return redius * redius * Double.pi
        }
        
        set {
            redius = sqrt(newValue / Double.pi)
        }
    }
}

var circle = Circle()
circle.redius = 5
print("Area of circle is:- \(circle.area)")
circle.area = 25
print("Redius:- \(circle.redius)")
              
//3.Create a swift program to show usage of stored properties.

struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}
var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
rangeOfThreeItems.firstValue = 6

//4.Create a swift program which has private properties which cannot directly be accessed. Means we cannot directly read or write it.

class PrivateProperties {
    private var name: String = "Yagnik"
    func myFunction() {
        print(name)
    }
}
let objectOfPrivateProperties = PrivateProperties()
objectOfPrivateProperties.myFunction()

//5.  Create one swift class which have two properties name and id, the class must have one initializer to set that properties. And create one array of that class types.
//Output: My class is Person and properties are id and name, then create an array of person. And print all elements of that array.
class PersonDetails {
    var nameOfPerson: String
    var idOfPerson: Int
    
    init (name: String, id: Int) {
        nameOfPerson = name
        idOfPerson = id
    }
}

var personArray: [PersonDetails] = []
personArray.append(PersonDetails(name : "Yagnik", id : 10))
personArray.append(PersonDetails(name : "Jay", id : 20))


for person in personArray {
    print("Name: \(person.nameOfPerson), id: \(person.idOfPerson)")
}

//6.Create one example of usage of willSet and didSet.

class Bank {
    var accountBalance: Double {
        didSet {
            sendMessageToUser()
        }
        willSet(newAccountBalance) {
            if(newAccountBalance >= 10000000)
            {
                sendMessageToAuditor()
            }
        }
    }
    init(_openingBalance: Double) {
        accountBalance = _openingBalance
    }
    
    func addMoney(amount: Double) {
        accountBalance += amount
    }
    
    func withDrawMoney(amount: Double) {
        accountBalance -= amount
    }
    
    func sendMessageToUser() {
        debugPrint("Account balance updated new balance = \(accountBalance)")
    }
    func sendMessageToAuditor() {
        debugPrint("Please check this account, and make sure the transaction is authentic")
    }
}
let bank = Bank(_openingBalance: 10000)
bank.addMoney(amount: 5000)

//7. Create one lazy stored property in a class and show usage of it.

struct InterviewCandidate {
    var isiOS:Bool?
    
    lazy var iOSResumeDescription: String = {
        return "I am an iOS developer"
    }()
    lazy var androidResumeDescription: String = {
        return "I am an android developer"
    }()
}
var person1 = InterviewCandidate()
person1.isiOS = true
if person1.isiOS! {
    print(person1.iOSResumeDescription)
} else {
    print(person1.androidResumeDescription)

}

//Type Properties
class SomeClass {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 27
    }
    
    class var overrideableComputedTypeProperty: Int {
        return 107
    }
}
class SubClass: SomeClass {
    override class var overrideableComputedTypeProperty: Int {
        return 100
    }
}
print(SomeClass.computedTypeProperty)
print(SomeClass.overrideableComputedTypeProperty)
print(SubClass.overrideableComputedTypeProperty)
