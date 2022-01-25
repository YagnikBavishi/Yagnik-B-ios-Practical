import UIKit

//Protocol example
@objc protocol Greet {
    var name: String { get }
    func message()
    @objc optional func display()
}

class Employee: Greet {
    var name = "Perry"
    
    func message() {
      print("Good Morning", name)
    }
}

class Employee1: Greet {
    var name = "Perry"
    
    func message() {
      print("Good Morning", name)
    }
}

var employee1 = Employee()
employee1.message()
print()

//generic function
func displayData<T>(data: T) {
  print("Generic Function:")
  print("Data Passed:", data)
}

displayData(data: "Swift")
displayData(data: 5)
displayData(data: 5.8)

