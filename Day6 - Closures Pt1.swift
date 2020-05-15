// Creating basic closures
let driving = {
    print("I'm driving")
}

driving()


// Accepting parameters in a closure: they are listed INSIDE the open braces
let drivingTo = { (place: String) in
    print("I'm going to \(place) in my car")
}

drivingTo("Pensacola") // We don't use parameter labels with closures


// Returnign values from a closure
let drivingWithReturn = { (place: String) -> String in
    "I'm going to \(place) in my car"
}

let message = drivingWithReturn("Milan")
print(message)


// Closures as parameters
func travel(action: () -> Void) {
    print("I'm getting ready to go")
    action()
    print("I arrived!")
}

travel(action: driving)

// Trailing closures syntax
travel() {
    print("I'm driving in my car")
}

// because there aren’t any other parameters, we can eliminate the parentheses entirely
travel {
    print("I'm driving in my car")
}

