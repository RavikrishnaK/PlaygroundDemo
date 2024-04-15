import UIKit

/// ** INTERVIEW - 1  **

/// MARK: 1.Question
var arraName = ["First","Second","Third"]
arraName.append("Swifttt")
arraName.append(String(100))
arraName.append(String(32.05))
print("1.Question Ans:")
print(arraName)
print("_________________")
print("")


///// MARK: 2.Question (Sort an array of names in reverse order using a trailing closure and use an auto closure to  remove elements from the list)
print("2.Question Ans:")
var names = ["Alice", "Bob", "Charlie", "David", "Eve"]
print("Original Array:")
print(names)
print("")

names.sort{ $0 > $1 }
print("Reversed by using sort function:")
print(names)

print("")
let newArr = names.sorted(by: >)
print("Reversed by using sorted function:")
print(newArr)
print("_________________")
print("Print Duplicate numbers and their frequency")

let inputs = [2, 3, 4, 5, 4, 6, 4, 7, 4, 5, 6, 6]
// Using the given line to find duplicates
let duplicateNumbers = Array(Set(inputs.filter { input in
    inputs.filter { $0 == input }.count > 1
}))
print("Duplicate Numbers: ",duplicateNumbers)

// Dictionary to store frequency of each element
var frequencyDict = [Int: Int]()

// Calculating frequency
for input in inputs {
    if duplicateNumbers.contains(input) {
        if let count = frequencyDict[input] {
            frequencyDict[input] = count + 1
        } else {
            frequencyDict[input] = 1
        }
    }
}

print("Frequency of duplicates:")
// Printing frequency of each duplicate element
for (element, frequency) in frequencyDict {
    print("Element \(element) occurs \(frequency) times")
}

// Removing elements from the array using an autoclosure
func removeElement(from array: inout [String], condition: @autoclosure () -> Bool) {
    if condition() {
        array.removeLast()
    }
}

// Example usage of the removeElement function with an autoclosure
removeElement(from: &names, condition: true)
print("After removing the last element: \(names)")



/// MARK: 3.Question (Create a function that will test to see whether a string value contains a valid IPv4 address. An IPv4 address is the address assigned to a computer that uses the Internet Protocol (IP) to communicate. An IP address consists of four numeric values that range from 0-255, separated by a dot (period) Example :  10.0.1.250)
print("3.Question Ans:")
func isValidIPv4Address(_ address: String) -> Bool {
    let octets = address.components(separatedBy: ".")
    // Check if there are exactly four octets
    guard octets.count == 4 else {
        return false
    }
    for octet in octets {
        // Check if each octet is a valid number
        guard let octetValue = Int(octet), (0...255).contains(octetValue) else {
            return false
        }
    }
    return true
}
// Example usage:
let ipAddress = "10.0.1.250456"
if isValidIPv4Address(ipAddress) {
    print("\(ipAddress) is a valid IPv4 address.")
} else {
    print("\(ipAddress) is not a valid IPv4 address.")
}
print("_________________")
print("")

/// MARK: 4.Question
/// (Create a class called VendingMachine. It must contain an array of strings called ‘items’ as a stored property e.g - var items: [String] = ["Akshay", "Rahul", "Mayank"] // Declare array and fill data It must also contain a function ‘getItem’ which takes a string and compares it to the items in the ‘items’ array. If the item is present, it should print ‘Here you go!’ or else it should throw a custom error ‘ItemNotAvailable’.
/// Step 2: call let objVendingMachine: VendingMachine = VendingMachine()
/// objVendingMachine.getItem(value "Rahul")
/// )
print("4.Question Ans:")

enum VendingMachineError: Error {
    case itemNotAvailable
}
class VendingMachine {
    var items: [String] = ["Akshay", "Rahul", "Mayank"]

    func getItem(value: String) throws {
        guard items.contains(value) else {
            throw VendingMachineError.itemNotAvailable
        }
        print("Here you go!")
    }
}
// Step 2: Create an instance of VendingMachine and call getItem
let objVendingMachine = VendingMachine()

do {
    try objVendingMachine.getItem(value: "Rahul")
} catch {
    print("Error: \(error)")
}

print("_________________")
print("")
/// MARK : 5 Question (How to take common elements and non-common elements  from two array in ios?)
print("5.Question Ans:")
let fruitsArray = ["apple", "mango", "blueberry", "orange"]
let vegArray = ["tomato", "potato", "mango", "blueberry"]
let totalArray = fruitsArray + vegArray
print("Total Array: ",totalArray)
let commonElements = fruitsArray.filter{vegArray.contains($0)}
print("Common elements: ",commonElements)
let nonCommonElements = fruitsArray.filter {!vegArray.contains($0)} + vegArray.filter {!fruitsArray.contains($0)}
print("Non-common elements:",nonCommonElements)

let perNames = ["Ashley", "Mary","Mary"]
let commonFilter = perNames.filter { elements in
    return elements.contains("Mary")
}
print("Common elements in single array:",commonFilter)

print("_________________")
print("")
/// MARK : 6 Question (Write a program to define closure which accepts string and return integer)
print("6.Sample clouser and Trailing escapingClosure and autoClosure:")
let testClosure: (_ name: String) -> (Int) = { (name) in
    return name.count
}
let closureRusult = testClosure("Ravi Krishna")
print("Sample Closure:",closureRusult)


func fetchMessageWithEscapingClosure (message:String, completionClosure: @escaping (_ numVal1: Int, _ numVal2: Int ) -> (Int)) {
    print(message)
    completionClosure(7, 42)
}
fetchMessageWithEscapingClosure(message: "Trailing Escaping closure message: Hello Closure") { val1, val2 in
    print("Trailing Escaping closure Result:",val2/val1)
    return val2/val1
}

print("_________________")
print("")



/// ** INTERVIEW - 2  **
//
//1.Main Thread Syntax
//2.Sample Closure syntax
//3.create enum with int
//4.create array model with struct
//5.how to write operational queue with example
//6.except struct and class, what are the other value types and  reference types
//7.where exactly use Weak self and unowned self
//8.Thread syntax and example
//9.why we connt create instance for abstract class

func mult(x: Int, y: Int) -> Int {
    if x == 0 || y == 0 {
        return 0
    }

    return x + mult(x: x, y: y - 1)
}

print(mult(x: 5, y: 10))


struct employee {
    let name:String?
    let age: Int?
    let salary:Int?
}

struct employeeArrModel {
    var employees : [employee]

    init(employeesParam:[employee]){
        self.employees = employeesParam
    }
}

enum sampleEnum: Int {
    case monday = 1
    case tuesday = 2
}

print("_________________")
print("")

// MARK : In Grand Central Dispatch (GCD), there are two main types of concurrent queues: normal concurrent queues created explicitly by the developer and global concurrent queues provided by the system.

// (Main thread syntax)
print("Main thread syntax")
DispatchQueue.main.async {
    print("This is main thread")
}
//DispatchQueue.main.after
DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
  // your code here
}

print("_________________")
print("Queues")
/// MARK :  (Queues)

// Serial Queues
let serialQueue = DispatchQueue(label: "com.serialQueue.test") // Serial Queue declaration
serialQueue.sync {
//    for i in 0..<10 {
//        print(i)
//    }
    print("When you add a task to a serial queue using the sync method, the calling thread waits until the task finishes executing before continuing.Synchronous tasks execute one after another in the order they are added to the queue. Adding tasks synchronously to a serial queue doesn't create a deadlock because the tasks execute sequentially on the same queue.")
}
print("_________________")
print("")
serialQueue.async {
    print("When you add a task to a serial queue using the async method, the calling thread continues its execution without waiting for the task to complete.Asynchronous tasks can execute concurrently with other tasks in the queue or on different queues. Tasks added asynchronously to a serial queue maintain their sequential order of execution, but they don't block the calling thread.")
}

// Normal concurrent queues
let normalConcurrentQueue = DispatchQueue(label: "com.normalConcurrentQueue.test", attributes: .concurrent)
normalConcurrentQueue.sync {
    print("When you add a task to a concurrent queue using the sync method, the calling thread waits until the task finishes executing before continuing.However, since it's a concurrent queue, tasks added synchronously don't necessarily execute concurrently; they may still run serially, one after the other.")
}
normalConcurrentQueue.sync {
print("In this example, both tasks execute sequentially because they are added synchronously to the concurrent queue. However, they could potentially execute concurrently if there were multiple threads available.")
}

normalConcurrentQueue.async {
    print("When you add a task to a concurrent queue using the async method, the calling thread continues without waiting for the task to complete.Asynchronous tasks execute concurrently with other tasks in the queue or on different queues.")
}
normalConcurrentQueue.async {
    print("In this example, both tasks are added asynchronously to the concurrent queue. They can execute concurrently on different threads, leading to non-deterministic order of execution")
}

// Global Concurrent Queues(Background thread)
DispatchQueue.global(qos: .background).sync {
    print("When you add a task to a global concurrent queue using the sync method, the calling thread waits until the task finishes executing before continuing.Synchronous tasks execute one after another in the order they are added to the queue but may run concurrently with tasks from other queues")
}

DispatchQueue.global(qos: .background).async {
    print("When you add a task to a global concurrent queue using the async method, the calling thread continues without waiting for the task to complete.Asynchronous tasks execute concurrently with other tasks in the queue or on different queues.")
}

// NSOperational Queues
let operation = BlockOperation()
operation.qualityOfService = .userInitiated
operation.addExecutionBlock {
    print("task1")
}
operation.addExecutionBlock {
    print("task2")
}
//operation.start()

let operation2 = BlockOperation()
operation2.addExecutionBlock {
    print("task3")
}

let opQueue = OperationQueue()
opQueue.qualityOfService = .userInitiated
opQueue.addOperations([operation,operation2], waitUntilFinished: false)



/// ** INTERVIEW - 3  **

///Capture list
///how to use Generics in protocol
///dispatch work item
///actor
///Secure enclave

/// -: DispatchWorkItem:-
let workItem = DispatchWorkItem {
    print("Executing work item")
}
let dispatchQue = DispatchQueue.global(qos: .userInitiated)
dispatchQue.async(execute: workItem)
//dispatchQue.asyncAfter(deadline: .now() + 2, execute: workItem) // execute workItem after 2 seconds
workItem.cancel()
workItem.notify(queue: dispatchQue){
    print("Work item execution done")
}
if workItem.isCancelled {
    print("Work item has been canceled")
}

func printType<T>(_ value: T) {
    let type = type(of: value)
    print(" \(type)")
}

printType("Hello, Swift")  // Output: The data type of Hello, Swift is String
printType([1,2,3])  // Output: The data type of [1,2,3] is Array<Int>


/// ** INTERVIEW - 4  **

// 1. var str = "nonrepeatcode" (getting non repeated indexes on this string)
// 2. let array = ["Ashley", "Mary","Kamal"] (added "John" string to every index of that array) O/p : ["Ashley John", "Mary John","Kamal John"]
//3.Storyboard task (2Textfields,button,label(display textfields data))
//4.SolidPrinciples explain
//5.APNS
//6.coreLocation methods
//7.instruments

print("_________________")
print("INTERVIEW - 4")

let array = ["Ashley", "Mary","Kamal"]
let appendStr = " John"
var added = array.map{$0 + appendStr}
print(added)

var str = "nonrepeatcode"
let characterIndices = Array(str.enumerated())
print("Enumarated items:",characterIndices)
let nonRepeatedIndices = characterIndices.filter { (index, character) in
    str.filter { $0 == character }.count == 1
}.map { $0.0 }
print("Non-repeated indices in the string:",nonRepeatedIndices)


/// ** INTERVIEW - 5  **
// 1. Async keyword and await keyword
// 2. combine framework
// 3. Publisher subscribe in designPatterns
// 4. when killed the appication still we need to get location usign some new feature

print("_________________")
print("INTERVIEW - 5")

let intro5 = ["ravi","krishna","rahul"]
let moreThan5Chars = intro5.filter{$0.count >= 5}
print(moreThan5Chars)

let firstLetterCapital = intro5.map{$0.capitalized}
print(firstLetterCapital)

print("_________________")
print("INTERVIEW - 6")

// 1.How to achieve multi threading in iOS
// 2.What is exact use of closure and Escaping,nonEscaping,auto
// 3.How to write asyn calls and syn calls
// 4.How to handle two asyn calls simultaniously without any dependency
// 5.When we use class over struct, vice versa
// 6.What is the main purpose of the protocol
// 7.How to write optional protools methods
// 8.Can we get the variable in extension protocol
// 9.Example for retain cycle happens
// 10.Deep Explore about MVC and MVVM (Advantages and disadvantages)
// 11.How to perform network calls
// Higher order functions with examples

let totalStr = "Ravi1234Krishna"
var count = 0

for digits in totalStr {
    let eachChar = Int(String(digits))
    if digits.isNumber {
        count += eachChar!
    }
}
print(count)

let testArr = ["john", 23, "james", 24, "vincent",34, "louis",29] as [Any]
var gettingStringsOnly = testArr.compactMap{$0 as? String}
print(gettingStringsOnly)

gettingStringsOnly.sort {$0 > $1}
print(gettingStringsOnly)

print("_________________")
print("Retain Cycle")

// Retain Cycle
class Person {
    let personName: String
    init(name:String){
        self.personName = name
    }
    var car: Car?
    deinit {
        print("\(personName) is being deinitialized")
    }
}
class Car {
    let carModel: String
    init(model:String){
        self.carModel = model
    }

   weak var owner: Person? // if weak remove here, deinit not getting called in both classes
    deinit {
        print("\(carModel) is being deinitialized")
    }
}

// Creating instances
var personObj:Person?
var carObj: Car?

// Creating a retain cycle
personObj = Person(name: "Ravi")
carObj = Car(model: "Tesla")

carObj?.owner = personObj
personObj?.car = carObj

// Setting references to nil to break the retain cycle
personObj = nil
carObj = nil


print("_________________")
print("CYIENT")

var thing = "cars"

let closure = { [thing] in
print("I love \(thing)")
} //(O/p: I love cars)
//(NOTE: let closure = { [thing] in print("I love \(thing)") }: You define a closure that captures the current value of thing (which is "cars") and prints it when called.)

//let closure = { in
//print("I love \(thing)")
//} /(O/p: I love airplanes)
//(NOTE: let closure = { print("I love \(thing)") }: You define a closure that captures thing by reference (implicitly), meaning it will use the latest value of thing when executed.)

thing = "airplanes"
closure() // Calling closure



print("_________________")
print("NetworkCall")

// Define the URL for the request
let urlString = "https://api.example.com/data"

// Create a URL object from the string
if let url = URL(string: urlString) {
    // Create a URLSession instance
    let session = URLSession.shared

    // Create a data task with the URL
    let task = session.dataTask(with: url) { (data, response, error) in
        // Check for errors
        if let error = error {
            print("Error: \(error)")
            return
        }

        // Check for successful response
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            print("Server Error")
            return
        }

        // Check if data is available
        if let data = data {
            // Parse the data if needed
            // For example, you can decode JSON data using JSONDecoder
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print("Response JSON: \(json)")
            } catch {
                print("Error parsing JSON: \(error)")
            }
        } else {
            print("No data received")
        }
    }

    // Start the data task
    task.resume()
} else {
    print("Invalid URL")
}

class Square {
    var side: Double = 0
    var area: Double {
        get{
            return side * side
        }
        set{
            side = newValue.squareRoot()
        }
    }
}
let squareObj = Square()
squareObj.side = 10
print(squareObj.area)
squareObj.area = 25
print(squareObj.side)





//let serialQueue = DispatchQueue(label: "com.serialQueue.example")
////serialQueue.sync {
////    print("Serial-Q1")
////    print("Serial-Q2")
////    print("Serial-Q3")
////    print("Serial-Q4")
////}
//serialQueue.async {
////    print("Serial With Async-Q1")
////    print("Serial With Async-Q2")
////    print("Serial With Async-Q3")
////    print("Serial With Async-Q4")
//
//    for i in 0...500 {
//        print(i)
//    }
//}
//
//serialQueue.async {
//    for r in 2000...2100 {
//        print(r)
//    }
//}
//let serialQueue = DispatchQueue(label: "com.example.serialQueue")
//
//serialQueue.async {
//    print("Task 1")
//}
//
//serialQueue.async {
//    print("Task 2")
//}
//
//print("End")

