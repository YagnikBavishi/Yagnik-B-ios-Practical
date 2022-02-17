import UIKit

//1.Write swift program using enumerations to check week day from given number. Consider Monday as 1 and Sunday as 7. We can be able to get day name as string in short form (sun, mon,...) and same full name (Sunday, Monday...) by given number of the day.

enum Days: Int, CaseIterable {
    case Monday = 1
    case Tuesday
    case Wednesday
    case Thursday
    case Friday
    case Saturday
    case Sunday
}
let number = 6
for day in Days.allCases {
    if day.rawValue == number {
        print(day)
    }
}
print()

//2.Create one enumeration program to return number of days in a month

enum Month {
    case January
    case February
    case March
    case April
    case May
    case June
    case July
    case August
    case September
    case October
    case November
    case December
}
var days = Month.April
switch days {
    case .January:
        print("31 Days in January..")
    case .February:
        print("28 Days in February..")
    case .March:
        print("31 Days in March..")
    case .April:
        print("30 Days in April..")
    case .May:
        print("31 Days in May..")
    case .June:
        print("30 Days in June..")
    case .July:
        print("31 Days in July..")
    case .August:
        print("31 Days in August..")
    case .September:
        print("30 Days in September..")
    case .October:
        print("31 Days in October..")
    case .November:
        print("30 Days in November..")
    case .December:
        print("31 Days in December..")
}
print()

//3.Write a swift program using enumerations to demonstrate Int enums

enum Color: Int{
    case red = 1, black, green, blue
}
let colorWithIntValue = Color.green.rawValue
print(colorWithIntValue)
print()

//4. Write a swift program using enumerations to demonstrate String enums

enum ColorWithString: String{
    case red, black, green, blue
}
let colorWithStringValue = ColorWithString.green
print(colorWithStringValue)
print()

//5.Write a swift program for enum with raw values

enum CollegeData: String {
    case studentName = "Yagnik"
    case collageName = "Charusat"
    case id = "10"
}
let collageTypeDetails = CollegeData.collageName
print("Collage:-\(collageTypeDetails)")
let collageName = CollegeData.collageName.rawValue
print("Collage Name:- \(collageName)")
print()

//6.Write a swift program using enumerations to get all cases as an array with use of CaseIterable(Optional) and without use of CaseIterable(Mandatory)

enum Enumeration: CaseIterable {
    case red
    case blue
    case black
    case white
}
var color = Enumeration.red
let totalCases = Enumeration.allCases.count
print("\(totalCases) cases in Enumerations.")
for index in Enumeration.allCases {
    print(index)
}
print()

//7. Write a swift program using enumerations for learn and demonsrate enum cases with parameters (Enum with associated values)

enum Student {
    case studentName(String)
    case mark(Int, Int, Int)
}
let studentName = Student.studentName("Yagnik")
let studentMark = Student.mark(90, 85, 80)
switch studentName{
case .studentName(let name):
    print("My name is \(name)")
case .mark(let mark1, let mark2, let mark3):
    print("Mark:- \(mark1) \(mark2) \(mark3)")
}
print()

//8.Create an enum with its rawValues of type String and show usage of case to print value of case.

enum CollegeInformation: String, CaseIterable {
    case studentName = "My name is Yagnik."
    case collageName = "My Collage Name is Charusat."
    case id = "My ID is 10."
}
CollegeInformation.allCases.forEach {
    print($0.rawValue)
}
