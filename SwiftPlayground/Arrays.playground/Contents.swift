import UIKit

var array = [1,2,3,5,1]
//1.
if array[0] == array[array.count - 1] {
    print(true)
} else {
    print(false)
}

// 2.
var size = (array.count) * 2
var allZeroElement = Array(repeating: 0, count: size - 1)
allZeroElement.append(array[array.count - 1])
print(allZeroElement)

//3.
var newArray:[Int] = []
if array.count > 2 {
    newArray.append(array[0])
    newArray.append(array[1])
    print(newArray)
}
else{
    print(array[0])
}

//4.
var maximumValue = array.max()
if let maximumValue = maximumValue {
    print(maximumValue)
}

//5.
let reversed = Array(array.sorted().reversed())
print(reversed)

//6.
var listOfNumbers = [1, 2, 3, 10, 100]
var divisors = [2, 5]
var answer = Set<Int>()

for index in 0...listOfNumbers.count - 1 {
    for jIndex in 0...divisors.count - 1 {
        if listOfNumbers[index] % divisors[jIndex] == 0 {
            answer.insert(listOfNumbers[index])
        }
    }
}

for index in answer {
    print(index)
}
