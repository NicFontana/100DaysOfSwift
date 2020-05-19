// Initializers
struct SimpleUser {
    var username: String
}

let simpleUser = SimpleUser(username: "nicfontana") // Default memberwise intializer

struct User {
    var username: String
    
    init() { // Our own initializer that replace the deafult one
        username = "Anonymus"
        print("All properties have been initialized - New user created!")
    }
}

var user = User()
user.username = "nicfontana"


// Referring the current instance: self
struct Person {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name // self points to whatever instance of the struct is currently being used
        self.age = age
    }
}


// Lazy properties
struct FamilyTree {
    init() {
        print("Creating a family tree, this is a heavy operation!")
    }
}

struct FamilyPerson {
    var name: String
    lazy var familyTree = FamilyTree() // lazy let us create some properties only when they are needed (i.e. when they are called)
}

var tod = FamilyPerson(name: "Tod")
print(tod.familyTree)


// Static properties and methods
struct Student {
    static var classSize = 0
    var name: String
    
    init(name: String) {
        self.name = name
        Student.classSize += 1
    }
}

print(Student.classSize)
let student = Student(name: "Tom")
print(Student.classSize)


// Access Control
struct IdentifiablePerson {
    private let ssn: String
    var name: String
    
    init(ssn: String, name: String) {
        self.ssn = ssn
        self.name = name
    }
    
    func identify() -> String { // Only the struct methods can access the private constant
        "My name is \(name) and my SSN is \(ssn)"
    }
}

let rob = IdentifiablePerson(ssn: "123-45-6789", name: "Rob")
print(rob.identify())
