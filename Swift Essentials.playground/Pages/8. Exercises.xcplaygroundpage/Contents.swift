/*:
 [Previous](@previous)
 
 # Swift Essentials
 ## 8. Exercises
 
 The following exercises cover the concepts learnt in the previous sections.
 
 - callout(Exercise 1):
 Declare an array using an array literal that contains the names of six suburbs.\
 Print the 4th suburb.
 
 ````
 The 4th suburb in the array is Oatley
 ````
 
 - - -
 */
var suburbs = ["Bankstown", "Chatswood", "Liverpool", "Oatley", "Newtown", "Parramatta"]
print("The 4th suburb in the array is \(suburbs[3])")
/*:
 - - -
 
 - note:
 Remember arrays are zero-indexed 😉
 
 
 - - -
 
 - callout(Exercise 2):
 Replace the third suburb with a new suburb.\
 Add a new suburb to the array.\
 Print the number of suburbs in the array.
 
 
 ````
 The suburbs array now contains 7 items
 ````
 
 - - -
 */
suburbs[2] = "Frenchs Forest"
suburbs.append("Sylvania")
print(suburbs.count)

/*:
 - - -
 
 - callout(Exercise 3):
 Insert a new suburb into the array at index `2`.\
 Remove the suburb at index `4` and print the name of that suburb.\
 Remove the last suburb and also print its name.
 
 
 ````
 Oatley was removed at index 4
 Sylvania was removed from the last position
 ````
 
 - - -
 */
suburbs.insert("Haymarket", at: 2)
print("\(suburbs.remove(at: 4)) was removed at index 4")
print("\(suburbs.removeLast()) was removed from the last position")
/*:
 - - -
 
 - callout(Exercise 4 - CHALLENGE):
 See if you can create an array of arrays 😎\
 \
 One array that contains nine seperate `Character` arrays as follows:\
 \
 `["A", "B", "C"]`\
 `["D", "E", "F"]`\
 `["G", "H", "I"]`\
 `["J", "K", "L"]`\
 `["M", "N", "O"]`\
 `["P", "Q", "R"]`\
 `["S", "T", "U"]`\
 `["V", "W", "X"]`\
 `["Y", "Z"]`\
 \
 Then get the individual `Character`'s from the outer array to spell `SWIFT` and store them in another array:\
 \
 `["S", "W", "I", "F", "T"]`\
 \
 Now print "SWIFT".
 
 ````
 SWIFT
 ````
 
 - note:
 A `String` can be initialised from a `[Character]`\
 \
 `let someString = String([charArray])`
 
 
 - - -
 */
let arrayOfArrays: [Array<Character>] =
    [["A", "B", "C"],
     ["D", "E", "F"],
     ["G", "H", "I"],
     ["J", "K", "L"],
     ["M", "N", "O"],
     ["P", "Q", "R"],
     ["S", "T", "U"],
     ["V", "W", "X"],
     ["Y", "Z"]]

let charArray = [arrayOfArrays[6][0], arrayOfArrays[7][1], arrayOfArrays[2][2], arrayOfArrays[1][2], arrayOfArrays[6][1]]
let someString = String(charArray)

print(someString)

/*:
 - - -
 
 - callout(Exercise 5):
 Declare a dictionary using a dictionary literal that stores the Blackjack value of the `13` face cards in a deck.\
 \
 Use a `String` of the face name (`"Ace"`, `"Two"`, `"Three"`, ... `"King"`) as the *key*,\
 and an `Int` for the *value*.
 
 - - -
 */
var blackjackCards = [
    "Ace" : 1,
    "Two" : 2,
    "Three" : 3,
    "Four" : 4,
    "Five" : 5,
    "Six" : 6,
    "Seven" : 7,
    "Eight" : 8,
    "Nine" : 9,
    "Ten" : 10,
    "Jack" : 11,
    "Queen": 12,
    "King": 13
]

/*:
 - - -
 
 - callout(Exercise 6):
 Add a Joker to the dictionary with a value of `21`.\
 Print the number of cards in the dictionary.\
 Print the Queens value.
 
 ````
 There are 14 cards
 The Queens value is 10
 ````
 
 - note:
 Remember a `Dictionary` returns an optional value.
 
 
 - - -
 */
blackjackCards["Joker"] = 21
print("There are \(blackjackCards.count) cards")
print("The Queens value is \(blackjackCards["Queen"]!)")

/*:
 - - -
 
 - callout(Exercise 7):
 Remove the Joker from the dictionary.\
 Choose three cards from the collection and add their values for a total.\
 Print the total.
 
 ````
 The total of my 3 cards is 16
 ````
 
 - - -
 */
blackjackCards["Joker"] = nil

print("The Queens value is \(blackjackCards["Queen"]!)")

let myCards = blackjackCards["Ace"]! +  blackjackCards["Five"]! + blackjackCards["Ten"]!
print("The total of my 3 cards is \(myCards)")
/*:
 - - -
 
 [Next](@next)
 */
