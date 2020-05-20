// Protocols
protocol Identifiable {
    var id: String { get set }
}

struct User: Identifiable {
    var id: String
}

func displayID(thing: Identifiable) {
    print("My ID is \(thing.id)")
}

displayID(thing: User(id: "NF"))

// Protocol inheritance
protocol Payable {
    func calculateWages() -> Int
}

protocol NeedsTraining {
    func study()
}

protocol HasVacation {
    func takeVacation(days: Int)
}

protocol Employee: Payable, NeedsTraining, HasVacation { }


// Extensions
extension Int {
    func squared() -> Int {
        self * self
    }
}

let number = 13
print(number.squared())

extension Int {
    var isEven: Bool { // with Extension we can only add computed properties
        self % 2 == 0
    }
}

print(number.isEven)


// Protocol extensions
// are like regular extensions, except rather than extending a specific type like Int you extend a whole protocol so that all conforming types get your changes.

let pythons: Array<String> = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"]
let beatles: Set<String> = ["John", "Paul", "George", "Ringo"]

extension Collection {
    func summarize() {
        print("There are \(count) of us:")
        
        for name in self {
            print(name)
        }
    }
}

// Both Array and Set now have that method
pythons.summarize()
beatles.summarize()


// Protocol Oriented Programming: crafting code around Protocol and Protocol Extension
// Protocol extensions can provide default implementations for our own protocol methods (implementation that is done in terms of the protocol's methods)
protocol NewIdentifiable {
    var id: String { get set }
    func identify()
}

extension NewIdentifiable { // Providing a defualt identify() implementation
    func identify() {
        print("My ID is \(id)")
    }
}

struct Player: NewIdentifiable {
    var id: String
}

let nico = Player(id: "nico")
nico.identify()

