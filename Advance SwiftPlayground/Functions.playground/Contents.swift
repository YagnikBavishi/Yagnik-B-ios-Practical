import UIKit

func student(name: String, surname: String) {
    print(name,surname)
}
student(name: "Yagnik", surname: "Bavishi")

//Functions with Optional Return Types

func minMax(array: [Int]) -> (min: Int, max: Int)? {
   if array.isEmpty { return nil }
   var currentMin = array[0]
   var currentMax = array[0]
   
   for value in array[1..<array.count] {
      if value < currentMin {
         currentMin = value
      } else if value > currentMax {
         currentMax = value
      }
   }
   return (currentMin, currentMax)
}

if let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
{
print(bounds.min,bounds.max)
}

//Specifying Argument Labels

func student1(name: String, surname: String) -> String {
    "Hello My name is: " + name + " & My surname is: " + surname
}

print(student1(name: "Yagnik", surname: "Bavishi"))


//Omit Argument

func sum(_ a: Int, _ b: Int) {
  print("Sum:", a + b)
}

sum(2, 3)

func sum1(of a: Int, and b: Int) {
  print("Sum:", a + b)
}

sum1(of:2, and:3)


//Variadic Parameters

func vari<N>(members: N...) {
   for i in members {
      print(i)
   }
}

vari(members: 4,3,5)
vari(members: 4.5, 5.6)
vari(members: "Swift 4", "Enumerations", "Closures")


//In-Out Parameters

func doubleInPlace(number: inout Int) {
    number *= 2
    print(number)
}

var myNum = 10
doubleInPlace(number: &myNum)

//function overloading

func displayValue (value: Int) {
    print("Integer value:", value)
}

func displayValue (value: String) {
    print("String value:", value)
}

displayValue(value: "Swift")
displayValue(value: 2)


//function overloading with argument lable

func display (person1 age: Int) {
    print("Person1 Age:", age)
}

func display (person2 age: Int) {
    print("Person2 Age:", age)
}

display(person1: 25)
display(person2: 38)

