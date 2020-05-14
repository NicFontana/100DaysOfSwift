// Arrays
let scores = [20, 13, 28, 18]

let names: [String] = ["Jim", "Pippo", "John"] // with explicit type

var emptyArray = [Double]() // or Array<Double>()
emptyArray.append(12.8)
let firstValue = emptyArray[0]


// Sets
let classMates = Set(["Aldo", "Giovanni", "Giacomo"])

var emptySet = Set<Int>()
emptySet.insert(18)
let removedValue = emptySet.remove(18)


// Tuples
let address = (number: 1004, street: "W Garden St", city: "Pensacola", state: "FL")
let street = address.street // or address.0
let city = address.2 // or address.city


// Dictionaries
var heights = [
    "Bob": 1.83,
    "Connie": 1.69
]

let bobHeight = heights["Bob"]
heights["Connie"] = 1.73
let johnHeight = heights["John", default: 1.80] // with deafult

var emptyDictionary = [String: Int]() // or Dictionary<String, Int>()


// Enumerations
enum Result {
    case success
    case failure
}
let result = Result.success
let anotherResult: Result = .failure

// Associated values
enum Activty {
    case bored
    case running(destination: String)
    case talking(topic: String)
    case singing(songTitle: String)
}
let johnActivity: Activty = .running(destination: "Palm Beach")
let maryActivity: Activty = .talking(topic: "Golf")

// Raw value
enum Planet: Int {
    case mercury = 1
    case venus
    case earth
    case mars
    case jupiter
    case saturn
    case uranus
    case neptune
}

let earth = Planet.earth
print(earth.rawValue)

let firstPlanet = Planet(rawValue: 1)
