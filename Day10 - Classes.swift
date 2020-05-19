// Creating classes
class Dog {
    var name: String
    var breed: String
    
    init(name: String, breed: String) { // No default memberwise initializer
        self.name = name
        self.breed = breed
    }
}

let zeus = Dog(name: "Zeus", breed: "Labrador")


// Class inheritnace
class Labrador: Dog {
    // Properties and Methods inherited from the superclasse
    
    init(name: String) {
        super.init(name: name, breed: "Labrador")
    }
}

let kira = Labrador(name: "Kira")


// Overriding methods
class Car {
    func makeNoise() {
        print("Whrooom!")
    }
}

class Lamborghini: Car {
}

class Ferrari: Car {
    override func makeNoise() { // the override keyword stops you from overriding a method by accident, and you’ll get an error if you try to override something that doesn’t exist on the parent class
        print("Whrooom! Whrooom!")
    }
}

let lambo = Lamborghini()
lambo.makeNoise()

let ferrari = Ferrari()
ferrari.makeNoise()


// Final classes
final class Person { // when you declare a class as being final, no other class can inherit from it.
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

class John: Person { // Error
}


// Copying objects
class Singer {
    var name: String = "Ed Sheeran"
}

var singer = Singer()
print(singer.name)

var singerCopy = singer
singerCopy.name = "Eminem"
print(singer.name) // prints "Eminem", classes are REFERENCE types


// Deinitializers
class Human {
    var name = "John Doe"
    
    init() {
        print("\(name) is alive!")
    }
    
    func printGreeting() {
        print("Hello, I'm \(name)")
    }
    
    deinit {
        print("\(name) is no more!")
    }
}

for _ in 1...3 {
    let human = Human()
    human.printGreeting()
}


// Mutability
let taylor = Singer()
taylor.name = "Taylor Swift" // this is perfectly fine even if taylor is a constant.
// Classes don’t need the mutating keyword with methods that change properties; that’s only needed with structs
