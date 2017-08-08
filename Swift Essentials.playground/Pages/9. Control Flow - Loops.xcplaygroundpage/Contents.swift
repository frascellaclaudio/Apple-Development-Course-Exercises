/*:
 [Previous](@previous)
 
 # Swift Essentials
 ## 9. Control Flow - Loops
 
 Swift provides a variety of control flow statements. These include `while` loops to perform a task multiple times; as well as a `for-in` loop that makes it easy to iterate over arrays, dictionaries, ranges, strings, and other sequences.
 
 - - -
 
 ### For-In Loops
 
 You use the `for-in` loop to iterate over a sequence, such as ranges of numbers, items in an array or dictionary.
 
 This example prints the first few entries in the five-times table:
 
 */
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}

/*:
 The sequence being iterated over is a range of numbers from `1` to `5`, inclusive, as indicated by the use of the closed range operator (`...`).
 
 The value of `index` is set to the first number in the range (`1`), and the statements inside the loop are executed.
 
 After the statement is executed, the value of `index` is updated to contain the second value in the range (`2`), and the `print()` function is called again.
 
 This process continues until the end of the range is reached.
 
 - - -
 
 ### Iterating Over an Array
 
 You can iterate over the entire set of values in an array with the `for-in` loop:
 
 */
let names = ["Afifi", "Christian", "Myrna", "Chris", "Elina", "Grant", "Adilakshmi", "William", "Warren", "Veronica", "Prateek", "My Chau"]

for name in names.sorted() {
    print("Hello, \(name)!")
}

/*:
 - note:
 You can call the `sorted()` method on an array, and it returns a copy of the array sorted.
 
 
 - - -
 
 ### Iterating Over a Dictionary
 
 You can also iterate over a dictionary to access its key-value pairs.
 
 Each item in the dictionary is returned as a `(key, value)` tuple when the dictionary is iterated.
 
 You can explicitly name the (key, value) constants for use within the body of the for-in loop:
 
 */
let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]

for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}

/*:
 - note:
 Items in a `Dictionary` may not necessarily be iterated in the same order in which they were inserted.\
 \
 The contents of a `Dictionary` are inherently unordered, and iterating over them does not guarantee the order in which they will be retrieved.
 
 - - -
 
 ### Dictionary Properties `keys` and `values`
 
 You can also retrieve an iterable collection of a dictionary’s keys or values by accessing its `keys` and `values` properties:
 
 */
for animalName in numberOfLegs.keys {
    print(animalName)
}

for legCount in numberOfLegs.values {
    print(legCount)
}

/*:
 - - -
 
 ### While Loops
 
 A `while` loop performs a set of statements until a condition becomes `false`. These kinds of loops are best used when the number of iterations is not known before the first iteration begins.
 
 Swift provides two kinds of `while` loops:
 
 - `while` evaluates its condition at the start of each pass through the loop.
 - `repeat-while` evaluates its condition at the end of each pass through the loop.
 
 - - -
 
 ### While
 
 A `while` loop starts by evaluating a single condition. If the condition is `true`, a set of statements is repeated until the condition becomes `false`:
 
 Here’s the general form of a `while` loop:
 
 */
let maxNumber = 10
var index = 0

while index < maxNumber {
    print("The index is: \(index)")
    index += 1
}

/*:
 - - -
 
 ### Repeat-While
 
 The other variation of the `while` loop, known as the `repeat-while` loop, performs a single pass through the loop block first, before considering the loop’s condition.
 
 It then continues to repeat the loop until the condition is `false`.
 
 Here’s an example:
 
 */
index = 0   // reset the index to 0

repeat {
    print("The index is: \(index)")
    index += 1
} while index < maxNumber

/*:
 - - -
 
 ### Control Transfer Statements - `continue` and `break`
 
 *Control transfer statements* change the order in which your code is executed, by transferring control from one piece of code to another.
 
 ### Continue
 
 The `continue` statement tells a loop to stop what it is doing and start again at the beginning of the next iteration through the loop.
 
 It says “I am done with the current loop iteration” without leaving the loop altogether.
 
 The following example removes all vowels and spaces from a `String` to create a cryptic puzzle phrase:
 
 */
let puzzleInput = "great minds think alike"
var puzzleOutput = ""

for character in puzzleInput.characters {
    switch character {
    case "a", "e", "i", "o", "u", " ":
        continue
    default:
        puzzleOutput.append(character)
    }
}

print(puzzleOutput)

/*:
 - note:
 A `String` has a `characters` property that returns a collection of `Character`'s.\
 \
 A `String` has an `append()` function that can add a `Character` or another `String`.
 
 - - -
 
 ### Break
 
 The `break` statement ends execution of an entire control flow statement immediately.
 
 The `break` statement can be used inside a `switch` statement or loop statement when you want to terminate the execution of the `switch` or loop statement earlier than would otherwise be the case.
 
 */
puzzleOutput = ""   // reset puzzleOutput to an empty string

for character in puzzleInput.characters {
    switch character {
    case "a", "e", "i", "o", "u", " ":
        break
    default:
        puzzleOutput.append(character)
    }
}

print(puzzleOutput)

for i in 1...5 {
    print(i)
    break
}

/*:
 - - -
 
 [Next](@next)
 */
