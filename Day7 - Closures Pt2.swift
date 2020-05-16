// Using closures as parameters when they accept parameters
func travel(action: (String) -> Void) {
    print("I'm getting ready to go")
    action("Tresigallo")
    print("I arrived!")
}

travel { (place: String) in
    print("I'm going to \(place) in my car")
}


// Using closures as parameters when they return values
func newTravel(action: (String) -> String) {
    print("I'm getting ready to go")
    
    let description = action("Tresigallo")
    print(description)

    print("I arrived!")
}

newTravel { (place: String) -> String in
    "I'm going to \(place) in my car"
}


// Shorthand parameter names
newTravel { place -> String in  // Swift already knows the parameters to that closure must be a String
    "I'm going to \(place) in my car"
}

newTravel { place in  // It also knows the closure must return a String
    "I'm going to \(place) in my car"
}

newTravel {  // Swift provides automatic names for the closure’s parameters: $0, $1, $2, ...
    "I'm going to \($0) in my car"
}


// Closures with multiple parameters
func travelWithSpeed(action: (String, Int) -> String) {
    print("I'm getting ready to go")
    action("Tresigallo", 80)
    print("I arrived!")
}

travelWithSpeed { place, speed in
    "I'm going to \(place) at \(speed) kilometers per hour"
}


// Returning closures from functions
func anotherTravel() -> (String) -> Void {
    return { place in
        print("I'm going to \(place)!")
    }
}

let result = anotherTravel()
result("Tresigallo")

anotherTravel()("Tresigallo") // It's possible, but not recommended


// Capturing values
func capturingTravel() -> (String) -> Void {
    var counter = 1 // Is captured by teh closure, so it will still remain alive along with the returned closure
    
    return {
        print("Closure called \(counter) times. I'm going to \($0)")
        counter += 1
    }
}

let result2 = capturingTravel()
result2("Tresigallo")
result2("Pensacola")
result2("San Francisco")
