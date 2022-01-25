import UIKit

//array
var array1: [Int] = []
var array = ["Yagnik","jay"]
print(array)
print(array[0])
array[0] = "meet"
print(array)

if array.isEmpty {
    print("The array is empty.")
} else {
    print("The array isn't empty.")
}

array.insert("Yagnik", at: 0)
print(array)
print(array.removeLast())
print()


//set
var set1 = Set<String>()
print(set1)
set1.insert("Yagnik")
print(set1)

var set : Set = ["Yagnik","Jay"]
print(set)
set.insert("Meet")
print(set)
let integer1:Set = [1,2,4,6,3]
let integer2:Set = [2,7,9,3,1,4,6]
print(integer1.union(integer2))
print(integer1.intersection(integer2))
print(integer1.subtracting(integer2))
print(integer1.symmetricDifference(integer2))
integer1.isSubset(of: integer2)
integer2.isSuperset(of: integer1)
integer1.isDisjoint(with: integer2)

//Dictionary
var dict: [Int: String] = [:]
print(dict)
dict[1] = "One"
print(dict)
var integer = [1:"One" , 2:"Two", 3:"Three"]
print(integer)
integer.updateValue("Four", forKey: 3)
print(integer)
print(integer.keys)
print(integer.values)
