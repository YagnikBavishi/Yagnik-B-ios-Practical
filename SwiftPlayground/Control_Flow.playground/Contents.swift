import UIKit

//1.Print the powers of 2 that are less than or equal to N.
var number1 = 100
var powerOfTwo = 1

for _  in 1...number1 {
    powerOfTwo = 2 * powerOfTwo
    if(powerOfTwo > number1) {
        break
    }
    
    print(powerOfTwo)
}

//2.Given an integer N draw a square of N x N asterisks. Look at the examples.
var number2 = 3
for _ in 1...number2 {
    
    for _ in 1...number2 {
        print("*" ,terminator: "")
    }
    
    print("")
}

//3.Given an integer N draw a triangle of asterisks. The triangle should have N lines, the i-th line should have i asterisks on it.
var number3 = 3
var index = 1
var jIndex = 1
for _ in 1...number3 {
    
    for _ in jIndex...index {
        print("*", terminator: "")
    }
    
    print("")
}

//4.Given an integer N draw a pyramid of asterisks. The pyramid should have N lines. On the i-th line there should be N-i spaces followed by i*2-1 asterisks.
var number4 = 5
index = 1
var counter = 0
while true{
    if(index % 2 != 0) {
        for _ in stride(from: number4 * 2, to: index ,by: -1) {
                print(" " , terminator: "")
        }
    }
    
    for _ in 1...index {
        if(index % 2 != 0) {
            print("*", terminator: "")
        }
    }
    
    if(index % 2 != 0) {
        print()
        counter = counter + 1
    }
    if(number4 == counter) {
        break
    }
    index = index + 1
}

//5.
var numberCheck = 17
var flag : Bool = false
if numberCheck > 1 {
   
    for iIndex in 2...numberCheck / 2 {
        if numberCheck % iIndex == 0 {
            flag = true
            break
        }
    }

if flag == false {
    print("Prime Number")
} else {
    print("Number is not Prime")
}
}
