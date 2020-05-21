// Optionals: data that may or may not be there
var age: Int? = nil // age currently not known
age = 26 // now it's known


// Unwrapping Optionals
let name: String? = nil

// we must look inside the optional and see what’s there: a process known as unwrapping
if let unwrapped = name {
    print("\(unwrapped.count) letters") // now we can use String's methods and properties
} else {
    print("Missing name")
}


// Unwrapping with guard
func greet(_ name: String?) {
    guard let unwrapped = name else { // deal with problems at the start of a function
        print("You didn't provide a name")
        return
    }
    
    // Now we are in the happy path - the path our code takes if everything is correct
    // and the unwrapped value is available after the guard statement
    print("Hello \(unwrapped)!")
}


// Force unwrapping
let str = "5"
let num = Int(str) // num is of type Int?

// we are sure that num isn't nil so we can force unwrap it
print(num!)

let anotherNum = Int("something")
print(anotherNum!) // This will crash


// Implicitly unwrapped Oprionals
var storage: Int! = nil // it's an Optional, but we can use it as if it wasn't optional at all

// they exist because sometimes a variable will start life as nil, but will always have a value before we need to use it
storage = 128
print(storage)


// Nil Coalescing
let dummyDatabase = [1: "JBrown", 2: "Chris13", 3: "CR7"]

func username(for id: Int) -> String? {
    dummyDatabase[id]
}

let user = username(for: 15) ?? "Anonymus"
// The nil coalescing operator unwraps an optional and returns the value inside if there is one.
// If there isn’t a value – if the optional was nil – then a default value is used instead.


// Optional chaining
let names = ["John", "Paul", "George", "Ringo"]

let beatle = names.first?.uppercased()
// That question mark is optional chaining – if first returns nil then Swift won’t try to uppercase it, and will set beatle to nil immediately.


// Optional try
enum PasswordError: Error {
    case weakPassowrd
}

func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.weakPassowrd
    }
    return true
}

do {
    try checkPassword("password")
    print("This password is good!")
} catch {
    print("You can't use this password: \(error)")
}

// There are 2 alternatives to do - catch blocks: try? and try!
if let result = try? checkPassword("password") {
    print("Result was \(result)")
} else {
    print("Your password is bad")
}
// try? changes throwing functions into functions that return an optional: if the function throws an error we’ll be sent nil as the result.

try! checkPassword("sekrit")
print("OK!")
// with try! if the function throws an error the app will crash


// Failable initializers
let maybeANum = Int(str) // this is a failable initializers

struct Person {
    var id: String
    
    init?(id: String) {
        if id.count == 9 {
            self.id = id
        } else {
            return nil
        }
    }
}


// Typecasting
class Animal { }

class Fish: Animal { }

class Dog: Animal {
    func makeNoise() {
        print("Woof!")
    }
}

let pets = [Fish(), Dog(), Fish(), Dog()] // type inference set the array as [Animal]

for pet in pets {
    if let dog = pet as? Dog { // Swift will check to see whether each pet is a Dog object
        dog.makeNoise()
    }
}
