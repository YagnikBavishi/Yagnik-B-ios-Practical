import UIKit

//Create a password validation program. If length of password is less than 8 characters, it throws “Password too short” exception and if password is empty, throw “Empty password” exception.
enum ValidationError: Error {
    case shortPassword
    case emptyPassword
    case inSufficientQuantity
}
struct PassWordValidations {
    func validation(givenPassword: String) throws {
        if givenPassword.count > 1 && givenPassword.count < 8 {
            throw ValidationError.shortPassword
        }
        if givenPassword.count == 0 {
            throw ValidationError.emptyPassword
        }
    }
    
}
let objectValidation = PassWordValidations()
do {
    try objectValidation.validation(givenPassword: "")
    print("PassWord is okk..")
} catch ValidationError.shortPassword {
    print("Your Password is too short..")
} catch ValidationError.emptyPassword {
    print("Your Password Filed is empty Please enter somethings into...")
}
print()

// Create a program for shopping cart. If desired quantity for an item is not available, throw exception
struct ShoppingCart {
    func CheckQuantity(itemQuantity: Int) throws {
        if(itemQuantity < 10) {
            throw ValidationError.inSufficientQuantity
        }
    }
}
let objectOfShoppingCart = ShoppingCart()
do {
    try objectOfShoppingCart.CheckQuantity(itemQuantity: 15)
    print("Desired Quantity for an item is available")
} catch ValidationError.inSufficientQuantity {
    print("Desired Quantity for an item is not available..")
}

//extension
struct Student {
    var name: String = ""
    var age: Int = 0
    func display() {
        print(name, age)
    }
}
var student = Student()
student.name = "Yagnik"
student.age = 21
student.display()

extension Student {
    func isVoter() -> Bool {
        return age > 18 ? true : false
    }
}
print(student.isVoter())


extension Int {
    func repetitions(task: () -> Void) {
        for _ in 0..<self {
            task()
        }
    }
}
3.repetitions {
    print("Hello!")
}
print()

//Create following string manipulation functions using string extensions:
//Add a character in a string at 5th position
//Replace one character with other in a string
//Remove white spaces from string
//Get number of words in a string

var string = "yagnik bavishi"
extension String {
    
    func addCharacter(index: Int, character: Character) -> String {
        var string = [Character](String(self))
        string[index - 1] = character
        return String(string)
    }
    
    func withReplacedCharacters() -> String {
        return self.replacingOccurrences(of: "y", with: "*")
    }
    
    func removeWhiteSpace() -> String {
        return self.replacingOccurrences(of: " ", with: "")
    }
    
    func countNumberOfWords () -> Int {
        let string = self.components(separatedBy: " ")
        return string.count
    }
}
print(string.addCharacter(index: 5, character: "B"))
print(string.withReplacedCharacters())
print(string.removeWhiteSpace())
print(string.countNumberOfWords())
