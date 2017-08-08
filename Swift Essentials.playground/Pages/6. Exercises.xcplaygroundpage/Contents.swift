import Foundation
/*:
 [Previous](@previous)
 
 # Swift Essentials
 ## 6. Exercises
 
 The following exercises cover the concepts learnt in the previous sections.
 
 - callout(Exercise 1):
 Use chaining `if` statements, to grade the `testScore` with the follwing rules:\
 \
 `1  to 24  = D`\
 `25 to 49  = C`\
 `50 to 74  = B`\
 `75 to 100 = A`\
 \
 If the score was 0 print `"You didn't sit the test"`
 
 
 ````
 Your Score of 2 receives a D
 
 Your Score of 92 receives an A
 ````
 
 - - -
 */
var testScore = 92

if testScore >= 1 && testScore <= 24 {
    print("Your Score of \(testScore) receives a D")
} else if testScore >= 25 && testScore <= 49 {
    print("Your Score of \(testScore) receives a C")
} else if testScore >= 50 && testScore <= 74 {
    print("Your Score of \(testScore) receives a B")
} else if testScore >= 75 && testScore <= 100 {
    print("Your Score of \(testScore) receives a A")
} else if testScore == 0 {
    print("You didn't sit the test")
}

/*:
 - - -
 
 - callout(Exercise 2):
 Using nested `if` statements, rewrite your solution above to allow for the following new rules:\
 \
 `Within the D range, a score greater than 12 receives a D+ otherwise it's a D-`\
 `Within the C range, a score greater than 37 receives a C+ otherwise it's a C-`\
 `Within the B range, a score greater than 62 receives a B+ otherwise it's a B-`\
 `Within the A range, a score greater than 87 receives an A+ otherwise it's an A-`
 
 
 ````
 Your Score of 17 receives a D+
 
 Your Score of 83 recieves an A-
 ````
 
 - - -
 */
testScore = 17

if testScore >= 1 && testScore <= 24 {
    if testScore > 12 {
        print("Your Score of \(testScore) receives a D+")
    } else {
        print("Your Score of \(testScore) receives a D-")
    }
} else if testScore >= 25 && testScore <= 49 {
    if testScore > 37 {
        print("Your Score of \(testScore) receives a C+")
    } else {
        print("Your Score of \(testScore) receives a C-")
    }
} else if testScore >= 50 && testScore <= 74 {
    if testScore > 62 {
        print("Your Score of \(testScore) receives a B+")
    } else {
        print("Your Score of \(testScore) receives a B-")
    }
} else if testScore >= 75 && testScore <= 100 {
    if testScore > 87 {
        print("Your Score of \(testScore) receives a A+")
    } else {
        print("Your Score of \(testScore) receives a A-")
    }
} else if testScore == 0 {
    print("You didn't sit the test")
}

/*:
 - - -
 
 - callout(Exercise 3):
 Rewrite your solution above using a `switch` statement.
 
 
 - note:
 You  should use interval matching, and remember you can use the ternary conditional operator 😊
 
 - - -
 */
testScore = 62
let grade: String

switch testScore {
case 1...24:
    print("Your Score of \(testScore) receives a D" + (testScore > 12 ? "+" : "-"))
case 25...49:
    print("Your Score of \(testScore) receives a C" + (testScore > 37 ? "+" : "-"))
case 50...74:
    print("Your Score of \(testScore) receives a B" + (testScore > 62 ? "+" : "-"))
case 75...100:
    print("Your Score of \(testScore) receives a A" + (testScore > 87 ? "+" : "-"))
case 0:
    print("You didn't sit the test")
default:
    print("")
}

/*:
 - - -
 
 - note:
 With the `testScore` example, a `switch` statement is better suited.
 
 - - -
 
 - callout(Exercise 4):
 Use a `nil` check on `possibleNumber` along with forced unwrapping to produce the desired result:\
 \
 `let possibleNumber = Int("32")`\
 `32 doubled equals 64`\
 \
 `let possibleNumber = Int("a")`\
 `There is no number!`
 
 - - -
 */
let possibleNumber = Int("32")

if possibleNumber != nil {
    print("\(possibleNumber!) doubled equals \(possibleNumber! * 2)")
} else {
    print("There is no number!")
}
/*:
 - - -
 
 - experiment:
 Rewrite your solution above using optional binding.
 
 - - -
 */
if let givenNumber = possibleNumber {
    print("\(givenNumber) doubled equals \(givenNumber * 2)")
} else {
    print("There is no number!")
}

/*:
 - - -
 
 - note:
 An `Int` has an itinialiser that attempts to convert a `String` to an `Int`.\
 As this could obviously fail if the `String` isn't a valid number, it returns an optional `Int` (`Int?`)
 
 - - -
 
 - callout(Exercise 5):
 Using the nil-coalescing operator (`a ?? b`) and variables to create the following greeting message:\
 \
 `Welcome <name>`\
 \
 `If the user is returning:`\
 `Hello again <name>`\
 \
 `If the user hasn't registered a name substitute it with Guest`
 
 
 ````
 Welcome Guest
 Welcome Leeroy
 Hello again Guest
 Hello again Leeroy
 ````
 
 - - -
 */
var yourName: String? = "Leeroy"
let returning = false
let guestName = yourName ?? "Guest"

if returning {
    print("Hello again \(guestName)")
} else {
    print("Welcome \(guestName)")
}


/*:
 - - -
 
 - callout(Exercise 6):
 Simulate a simple dice roll game, where a player rolls a six-sided die to recieve a score.\
 The player can optionally specify their name, or `Player 1` is used as the default.\
 \
 How the scoring works:\
 \
 The dies face value is the base for the players score.\
 `2`'s and `6`'s double the players score.\
 \
 Use optional `String`'s in your code, and produce the following output:
 
 ````
 Player 1 you rolled a two for a score of 4
 Lee you rolled a five for a score of 5
 Lee you rolled a six for a score of 12
 ````
 
 - note:
 You may need to **cast** an `UInt` to an `Int`
 
 - - -
 */
var name: String?
var diceRoll: String? = "5"
var diceFace:String?

let playerName = name ?? "Player 1"
var playerScore: String?

if var possibleScore = Int(diceRoll!) {
    if possibleScore == 2 || possibleScore == 6 {
        possibleScore = possibleScore * 2
    }
    playerScore = String(possibleScore)
    
    if let face = diceRoll {
        switch face {
        case "1":
            diceFace = "one"
        case "2":
            diceFace = "two"
        case "3":
            diceFace = "three"
        case "4":
            diceFace = "four"
        case "5":
            diceFace = "five"
        case "6":
            diceFace = "six"
        default:
            break
        }
        
        print("\(playerName) you rolled a \(diceFace!) for a score of \(playerScore!)")
    }
}


