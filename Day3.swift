// Arithmetic operators
let firstScore = 13
let secondScore = 7

let sum = firstScore + secondScore
let difference = firstScore - secondScore
let product = firstScore * secondScore
let divided = firstScore / secondScore
let remainder = 13 % secondScore


// Operator Overloading: what an operator does depends on the values you use it with
let integerSum = 13 + 9
let stringConcat = "John" + " Appleseed"
let arrayConcat = ["Apple", "Peach"] + ["Potato", "Avocado"]
let error = "String" + 13 // ERROR: Swift is type-safe


// Compound Assignment operators
var fullName = "Tom"
fullName += " Bradshow" // "Tom Bradshow"

var totalScore = 80
totalScore -= 7


// Comparison operator
firstScore == secondScore // false
firstScore != secondScore // true
firstScore < secondScore // false
firstScore >= secondScore // true
// Each of these also work with strings, because strings have a natural alphabetical order
"Taylor" < "Swift" // false


// Conditions
let firstCard = 11
let secondCard = 10

if firstCard + secondCard == 21 {
    print("Blackjack!")
} else if firstCard + secondCard == 2 {
    print("Aces - lucky!")
} else {
    print("Regular cards")
}


// Combining Conditions
let age1 = 12
let age2 = 21

if age1 > 18 && age2 > 18 {
    print("Both are over 18")
}

if age1 > 18 || age2 > 18 {
    print("At least one is over 18")
}


// Ternary operator
print(firstCard == secondCard ? "Cards are the same" : "Cards are different")


// Switch statements
let weather = "sunny"

switch weather {
case "rain":
    print("Bring an umbrella")
case "snow":
    print("Wrap up warm")
case "sunny":
    print("Wear sunscreen")
    fallthrough // If we want to continue the execution on the next case
default: // Required beacuase switch must be exhaustive
    print("Enjoy your day!")
}


// Range operators
let mark = 85

switch mark {
case 0..<50:
    print("You failed badly.")
case 50...85:
    print("You did OK.")
default:
    print("You did great!")
}
