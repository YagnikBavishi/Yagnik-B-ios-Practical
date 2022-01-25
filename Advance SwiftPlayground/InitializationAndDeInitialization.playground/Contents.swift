import UIKit

// Struct with default init
struct Item {
    let name: String
    let cost: Int
}
let object = Item(name: "laptop", cost: 100000)
print()

//class with init
class ItemClassWithInitBlock {
    let name: String
    let cost: Int
    init(name: String, cost: Int) {
        self.name = name
        self.cost = cost
    }
}
let ojectOfClass = ItemClassWithInitBlock(name: "Mobile", cost: 20000)
print(ojectOfClass.name)
print()

//Failable Initializer
struct Person {
    var addarNumber: String
    init?(addarNumber: String) {
        if(addarNumber.count < 12) {
            return nil
        }
        self.addarNumber = addarNumber
    }
}
let objectOfPerson = Person(addarNumber: "1234-5555")
print(objectOfPerson?.addarNumber ?? "Invalid Aaddar card Number")
print()

//Deinitialization
class DeinitializationExample {
    init() {
        print("Init bolck is called..")
    }
    func myFuction() {
       print("Function block is called...")
    }
    deinit {
       print("deinit bolck is callled..")
    }
}
var objectOfDeinitialization: DeinitializationExample? = DeinitializationExample()
objectOfDeinitialization?.myFuction()
objectOfDeinitialization = nil
print()

