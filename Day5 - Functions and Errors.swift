// Writing functions
func printHelp() {
    let message = """
Welcome to MyApp!

Run this app inside a directory of images and
MyApp will resize them all into thumbnails
"""
    
    print(message)
}

printHelp()


// Accepting parameters
func square(number: Int) {
    print(number * number)
}

square(number: 10)


// Returning values
func newSquare(number: Int) -> Int {
    return number * number
}

let result = newSquare(number: 10)
print(result)


// Parameter labels
func sayHello(to name: String) {
    print("Hello \(name)!")
}

sayHello(to: "Bob")


// Omitting parameter labels
func greet(_ name: String) {
    print("Hello \(name)!")
}

greet("Bob")


// Default parameters
func newGreet(_ person: String, nicely: Bool = true) {
    if nicely {
        print("Hello \(person)!")
    } else {
        print("Oh no! It's \(person) again...")
    }
}

newGreet("Bob")
newGreet("Bob", nicely: false)


// Variadic functions
func square(numbers: Int...) {
    print("numbers is of type Array<Int>: \(numbers)")
    
    for n in numbers {
        print("\(n) squared is \(n * n)")
    }
}
square(numbers: 1,2,3,4,5)


// Throwing functions
enum PasswordError: Error {
    case weakPassowrd
}

func checkPassword(password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.weakPassowrd
    }
    return true
}


// Running throwing functions (part of error handling)
do {
    try checkPassword(password: "password")
    print("This password is good!")
} catch {
    print("You can't use this password: \(error)")
}


// inout parameters
// inout paramters can be changed inside your function, and those changes reflect in the original value outside the function
func doubleInPlace(_ number: inout Int) {
    number *= 2
}

var number = 10
doubleInPlace(&number)
print(number)

