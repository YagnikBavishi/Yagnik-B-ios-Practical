import UIKit

// Strucutre
//1.Create one structure of type Work, which have some properties like work location, work hours and one string array of project names. And create a function inside structure which returns all project names for the person.

struct Work {
    var workLocation: String
    var workHour: Int
    var array = ["project1", "project2", "project3"]
    
    func myFunction(){
        for index in array{
            print(index)
        }
        print("Working Hours:- \(workHour)")
        print("Work Location:- \(workLocation)")
    }
}
let workInstance = Work(workLocation: "Ahmedabad", workHour: 8)
workInstance.myFunction()
print()

//2.Create a structure example which demonstrates use of initializer in structures
struct InitializerWithoutParamter {
    var name: String = "Yagnik"
    init() {
        print("My name is:-\(name)")
    }
}
let name = InitializerWithoutParamter()
print()

//3.Create a structure program which can be initialized with parameters and it also should be able to initialized without parameters.

struct InitializerWithParamter {
    var surname: String
    init(surname: String) {
        self.surname = surname
        print("My surname is:-\(surname)")
    }
}
let surname = InitializerWithParamter(surname : "Bavishi")
print()

// 4.Create one structure which have initializer which takes array of int as input returns  two arrays one of all even numbers and another is all odd numbers.
//Input: [1, 3, 5, 6, 8, 10, 9, 7, 8, 12]
//Output: even numbers are: [6, 8, 10, 8, 12]
//                 Odd numbers are: [1, 3, 5, 9, 7]

struct EvenandOddarray {
    var inputArray = [Int]()
    var evenArray:[Int] {
        return inputArray.filter{ $0 % 2 == 0}
    }
    var oddArray:[Int] {
        return inputArray.filter{ $0 % 2 != 0}
    }
}

var array = [1, 3, 5, 6, 8, 10, 9, 7, 8, 12]
var objectOfEvenOddNumbers = EvenandOddarray(inputArray: array)
print("Even Array:\(objectOfEvenOddNumbers.evenArray)")
print("Odd Array:\(objectOfEvenOddNumbers.oddArray)")
print()

//5.Create one swift structure program for person that contains basic details like name, age, gender. Then create one array of person with all details. Print all details of that array.
// Consider two persons array for Joe and Harry. But in your code Its size can be vary.
//Output be like: Name: Joe, Gender: Male, Age: 27
//  Name: Harry, Gender: Male, Age: 21

struct PersonDetails {
    var nameOfPerson: String
    var ageOfPerson: Int
    var genderOfPerson: String
}

var personArray: [PersonDetails] = []
personArray.append(PersonDetails(nameOfPerson : "Yagnik", ageOfPerson : 21, genderOfPerson: "Male"))
personArray.append(PersonDetails(nameOfPerson : "Jay", ageOfPerson : 21, genderOfPerson: "Male"))
personArray.append(PersonDetails(nameOfPerson : "Meet", ageOfPerson : 23, genderOfPerson: "Male"))

for person in personArray {
    print("Name: \(person.nameOfPerson), Age: \(person.ageOfPerson), Gender: \(person.genderOfPerson)")
}
print()

//6.Perform same example given in class question no 10 and check output using structure. Try to find difference between these two outputs and try to figure out the reason for that output.

struct ReffernceStruct {
    var greetMessage = ""
}

var objectOneForStruct = ReffernceStruct()
objectOneForStruct.greetMessage = "Hello"
var objectTwoForStruct = objectOneForStruct
objectTwoForStruct.greetMessage = "Hi"
print("First object greet message: \(objectOneForStruct.greetMessage), second object greet message: \(objectTwoForStruct.greetMessage)\n")

//7.Try to figure out basic difference between class and structures and give a demo for same
//Differnece :- Class instance is passed as Refernce type where as Struct instance passed as Value type.
//Inheritance is possible in class but it is not possible in struct.
//Type casting is possible in class but it is not possible in struct.


//Class:-
//1.Create a swift program to demonstrate swift class. Which has two variables inside class body. Access (Set its values and get its value.) these variables by creating one instance of class.

class DemoClass {
    var minValue = 0
    var maxValue = 0
}

let arrayOFDemoClass = [1, 3, 4, 5, 7, 2]
let objectDemoClass = DemoClass()
if let minValue = arrayOFDemoClass.min() {
    objectDemoClass.minValue = minValue
}
if let maxValue = arrayOFDemoClass.max() {
    objectDemoClass.maxValue = maxValue
}

print("Minimum Value: \(objectDemoClass.minValue)")
print("Maximum Value: \(objectDemoClass.maxValue)")
print()

//2.Create a swift program to demonstrate usage of swift class for usage of multiple initializers. Create one initializer with two parameters your name and college and another initializer with your name and department. You can be able to access these properties using instance of class.

class Student {
    var nameOfStudent: String
    var collegeOfStudent = ""
    var departmentOfStudent = ""
    
    init() {
        nameOfStudent = "abc"
        collegeOfStudent = "def"
    }
    
    init(name: String, department: String) {
        nameOfStudent = name
        departmentOfStudent = department
    }
}

var newStudent = Student()
print("My Name is: \(newStudent.nameOfStudent), College name is : \(newStudent.collegeOfStudent), ",terminator: "")
newStudent = Student(name: "Yagnik", department: "IT")
print("Department name is: \(newStudent.departmentOfStudent)\n")

//3.Create a swift class without initializers and access (write, read) its properties using instance of class.

class WithoutInitializerExample {
    var firstParameter = 0
    var secondParameter = 0
}

let newObject = WithoutInitializerExample()
newObject.firstParameter = 10
newObject.secondParameter = 20
print("First parameter: \(newObject.firstParameter), Second parameter: \(newObject.secondParameter)\n")
 
//4.Create a swift class which is having code to return square of given number and access this code using class instance.

class Square {
    var inputNumber = 0
    var squareOFGivenNumber: Int {
        return inputNumber * inputNumber
    }
}

var squareObject = Square()
squareObject.inputNumber = 4
print("Square of \(squareObject.inputNumber) is \(squareObject.squareOFGivenNumber)")
print()

//5.Create a swift class example to show use of swift inheritance. Your base class has some property access this property. In two different child classes and show its usage using the instances of both child classes.

class Animal {
    var heightOfAnimal: Int
    
    init (height: Int) {
        heightOfAnimal = height
    }
}

class WildAnimal: Animal {
    var nameOfAnimal = ""
}

class PetAnimal: Animal {
    var nameOfAnimal = ""
}

let wildAnimalObject = WildAnimal(height: 10)
wildAnimalObject.nameOfAnimal = "Tiger"
let petAnimalObject = PetAnimal(height: 4)
petAnimalObject.nameOfAnimal = "Cat"
print("Wild animal name: \(wildAnimalObject.nameOfAnimal), height: \(wildAnimalObject.heightOfAnimal) and ", terminator: "")
print("Pet animal name: \(petAnimalObject.nameOfAnimal), height: \(petAnimalObject.heightOfAnimal)")

//6.Create a swift class example to show use of swift base class which have some implementation inside any method. Now demonstrate usage of overriding that method implementation.

class ParentClass {
    func displayMessage() {
        print("Inside base class")
    }
}

class ChildClass: ParentClass {
    override func displayMessage() {
        print("Inside child class")
    }
}

let paremtClassObject = ParentClass()
let childClassObject = ChildClass()
paremtClassObject.displayMessage()
paremtClassObject.displayMessage()
print()

//7.Create a swift class with an initializer in a manner that you can create this class using initializing value. And one function which takes int input and returns the power of class instance.
//example:  let instance = Example(value: 5)
//    let result = instance.doPower(power: 3)
//then it should return 5's 3 power (125)

class InitializerExample {
    let inputNumber: Int
    
    init(inputNumber: Int) {
        self.inputNumber = inputNumber
    }
    
    func getThirdPower(power: Int) -> Int {
        return Int(pow(Double(inputNumber), Double(power)))
    }
}

let initializerExampleObject = InitializerExample(inputNumber: 5)
let powerOfInputNumber = 3
print("\(initializerExampleObject.inputNumber) power \(powerOfInputNumber) is:-  \(initializerExampleObject.getThirdPower(power: powerOfInputNumber))")
print()

//8.Create a swift class example which has a parent class for vehicles, and child classes for two different vehicles e.g. (bike & car). You need to use common properties and method in the parent class and inside child class, there will be some different property which is not common.

// Same as Inheritance example :- Q :- 8

//9.Create a person swift class with person name initializer and create one function to greet that person.
//Example: let person1 = Person(name: Joe)
//  Person1.greet() This should print “Hello Joe”

class Person {
    let nameOfPerson: String
    
    init(nameOfPerson: String) {
        self.nameOfPerson = nameOfPerson
    }
    
    func displayMessage() {
        print("Hello, \(nameOfPerson)")
    }
}

let personClassObject = Person(nameOfPerson: "Yagnik")
personClassObject.displayMessage()
print()

//10.Create a swift class with some property. And then set its value using initializer of class, then perform below actions.
//let example1 = Example()
//Example1.a = “Hello”
//let example2 = example1
//example2.a = “Hi”
//print(example1.a)
//print(example2.a)
//// Consider ‘a’ as string property of example class.
//--> Check these two print outputs and try to find out the reason for that output.

class ReffernceClass {
    var greetMessage = ""
}

let objectOne = ReffernceClass()
objectOne.greetMessage = "Hello"
let objectTwo = objectOne
objectTwo.greetMessage = "Hi"
print("First object greet message: \(objectOne.greetMessage), second object greet message: \(objectTwo.greetMessage)\n")
