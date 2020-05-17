// Structs
struct Sport {
    var name: String // Stored property
}

var tennis = Sport(name: "Tennis")
print(tennis.name)

tennis.name = "Lawn Tennis"


// Computed properties
struct Sport2 {
    var name: String
    var isOlympic: Bool
    
    var olympicStatus: String { // Computed properties
        if isOlympic {
            return "\(name) is an Olympic sport"
        } else {
            return "\(name) is not an Olympic sport"
        }
    }
}

let pickleball = Sport2(name: "Pickleball", isOlympic: false)
print(pickleball.olympicStatus)


// Property observers
struct Progress {
    var task: String
    var amount: Int {
        didSet { // We can also have willSet but it's rarely used
            print("\(task) is now \(amount)% complete")
        }
    }
}

var progress = Progress(task: "Loading data", amount: 0)
progress.amount = 30
progress.amount = 80
progress.amount = 100


// Methods
struct City {
    var population: Int
    
    func collectTaxes() -> Int {
        population * 1_000
    }
}

let london = City(population: 9_000_000)
london.collectTaxes()


// Mutating methods
struct Person {
    var name: String
    
    mutating func makeAnonymus() {
        name = "Anonymus"
    }
}

var frank = Person(name: "Frank")
frank.makeAnonymus() // Only possible if frank is a var


// Properties and methods of String
let string = "Strings in Swift are structs"

print(string.count)
print(string.hasPrefix("Str"))
print(string.uppercased())
print(string.lowercased())
print(string.sorted())


// Properties and methods of Array
var toys = ["Woody"]

print(toys.count)
toys.append("Buzz")
toys.firstIndex(of: "Buzz")
print(toys.sorted())
toys.remove(at: 1)
