import UIKit

//1. Hello Word..
print("Hello Word!!")

//2. Varible declaration
var booleanVarible:Bool = true
print("Boolean value: \(booleanVarible)")
var intergerVarible : Int = 10
print("Interger value: \(intergerVarible)")
var interger8:Int8 = -128
print("Interger8 value: \(interger8)")
var floatVarible:Float = 3.14
print("Float value: \(floatVarible)")
var doubleVarible:Double = 3.14
print("Double value: \(doubleVarible)")
var characterVarible:Character = "Y"
print("Char value: \(characterVarible)")
var string = "my name is yagnik"
print("String value: \(string)")

//3. String declaration
string.uppercased()

//4. Create one integer and perform addition with 5 to that and print values
var number = 10
var result = number + 5
print("Result: \(result)")


//5. There is one constant with value of interest rate (15%) create one playground for calculate interest for given amount and duration
let interestRate = 15
var amount = 10000
var duaration = 2
print("Interest : \(interestRate * amount * duaration)")
