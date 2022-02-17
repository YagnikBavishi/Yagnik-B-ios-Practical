import UIKit

//8.Create one class as Base type Person which has common properties like name, occupation, etc. Create two child classes from the person which are Student, Employee and this two-child classes must have base properties and some other properties also. Example, student have college, but Employee have company. And demonstrate the usage of inheritance.

class Person {
    var name: String = ""
    var occupations: String = ""
    
    init(name: String, occupations: String) {
        self.name = name
        self.occupations = occupations
    }
    func display() {}
}

class Student: Person {
    var collageName: String = ""
    
    init(nameofStudent: String, occupations: String, collageName: String) {
        self.collageName = collageName
        super.init(name: nameofStudent, occupations: occupations)
    }
    override func display() {
        print("Name of the Student is:- \(super.name), occupations of student is:- \(super.occupations) and Collage name is:- \(collageName)\n ")
    }
}
class Employee: Person {
    var comapanyName: String = ""
    
    init(nameofStudent: String, occupations: String, collageName: String) {
        self.comapanyName = collageName
        super.init(name: nameofStudent, occupations: occupations)
    }
    override func display() {
        print("Name of the Employee is:- \(super.name) , occupations of Employee is:-  \(super.occupations) and company name name is:- \(comapanyName) ", terminator: "")
    }
}

let studentObject = Student(nameofStudent: "yagnik", occupations: "IT", collageName: "Charusat")
let employeeObject = Employee(nameofStudent: "yagnik", occupations: "IT", collageName: "Simform")
studentObject.display()
employeeObject.display()
print()

//10. Same as Class problem Q-10

//19. Create one base class of type Song and create subclasses of music types (Hip-Hop, classical) and show usage of inheritance. // Here Music class have property singer, composer
//Same as Above Q-8

//20.Create a swift class with properties which can be read-write outside of class.
// When we define properties by default it is public.
 
