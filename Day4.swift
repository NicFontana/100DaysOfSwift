// For loops
let range = 1...10
for number in range {
    print(number)
}

let animals = ["lion", "tiger", "panter", "leopard"]
for animal in animals {
    print(animal)
}

for _ in 0..<5 {
    print("Ignoring the for loop constant")
}


// While loops
var countDown = 20

while countDown > 0 {
    print(countDown)
    countDown -= 1
}
print("Finish!")


// Repeat loops
countDown = 20

repeat {
    print(countDown)
    countDown -= 1
} while countDown > 0

while false {
    print("This statement will never be executed")
}

repeat {
    print("This statement is executed!")
} while false


// Early exiting loops
countDown = 10

while countDown >= 0 {
    print(countDown)
    
    if countDown == 4 {
        print("I'm bored, let's go now!")
        break
    }
    
    countDown -= 1
}


// Early exiting in multiple loops
outerLoop: for i in 1...10 { // Give the loop a label
    for j in 1...10 {
        let product = i * j
        print ("\(i) * \(j) is \(product)")
        
        if product == 50 {
            print("It's a bullseye!")
            break outerLoop // This will break both loops!
        }
    }
}


// Skipping items
for i in 1...10 {
    if i % 2 == 1 { // Skipping odd itmes
        continue
    }
    print(i)
}


// Infinite loops
var counter  = 0

while true {
    print(" ")
    counter += 1
    
    if counter == 275 {
        break
    }
}
