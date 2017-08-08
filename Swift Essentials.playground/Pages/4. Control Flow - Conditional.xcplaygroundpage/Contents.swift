import Foundation
/*:
 [Previous](@previous)
 
 # Swift Essentials
 ## 4. Control Flow - Conditional
 
 Swift provides a variety of conditional control flow statements. These include `if`, `guard`, and `switch` statements to execute different branches of code based on certain conditions.
 
 ### Conditional Statements
 
 It is often useful to execute different pieces of code based on certain conditions. You might want to run an extra piece of code when an error occurs, or to display a message when a value becomes too high or too low. To do this, you make parts of your code *conditional*.
 
 - - -
 
 ### If
 
 In its simplest form, the `if` statement has a single `if` condition. It executes a set of statements only if that condition is `true`.
 
 The example below checks whether the `temperature` is less than or equal to `12` degrees. If it is, a message is printed. Otherwise, no message is printed, and code execution continues after the `if` statement’s closing brace.
 
 */
var temperature = 10

if temperature <= 12 {
    print("It's very cold. Consider wearing a jacket.")
}

/*:
 - note:
 Parentheses `()` around the condition are optional. Braces `{}` around the body are required.\
 \
 Code enclosed in braces `{}` is often refered to as a code block or block of code.
 
 - - -
 
 ### Else
 
 The `if` statement can provide an alternative set of statements, known as an *else clause*, for situations when the `if` condition is `false`. These statements are indicated by the `else` keyword.
 
 */
temperature = 22

if temperature <= 12 {
    print("It's very cold. Consider wearing a jacket.")
} else {
    print("It's not that cold. Wear a t-shirt.")
}

/*:
 One of these two branches is always executed. Because the `temperature` has increased to `22` degrees, it is no longer less than or equal to `12` and so the `else` branch is triggered instead.
 
 - important:
 Remember using conditional operators in an expression evaluates to a `Bool` result, `true` or `false`.\
 \
 The following is a simplified example:
 
 */
let expressionResult = temperature <= 12

if true {
    print("It was true!")
} else {
    print("It was false!")
}

/*:
 - note:
 Notice how Xcode warns us that a certain block of code will never be executed. This is because we have hard-coded the Boolean result.
 
 - - -
 
 ### Chaining If Statements
 
 You can chain multiple `if` statements together to consider additional clauses.
 
 */
temperature = 20

if temperature <= 12 {
    print("It's very cold. Consider wearing a jacket.")
} else if temperature >= 36 {
    print("It's really warm! Don't forget to wear sunscreen.")
} else {
    print("It's not that cold. Wear a t-shirt.")
}
/*:
 - experiment:
 Change the `temperature` above to execute the final `else` clause.
 
 - - -
 
 ### Nesting If Statements
 
 You can also nest multiple levels of `if` statements.
 
 */
temperature = 4

if temperature <= 12 {
    if temperature > 6 {
        print("It's very cold. Consider wearing a jacket.")
    } else {
        print("It's extremely cold! Stay inside.")
    }
} else {
    print("It's not that cold. Wear a t-shirt.")
}

/*:
 - - -
 
 ### Ternary Conditional Operator
 
 The *ternary conditional operator* is a special operator with three parts, which takes the form:\
 `condition ? answer1 : answer2`.
 
 It is a shortcut for evaluating one of two expressions based on whether `condition` is `true` or `false`.
 
 If `condition` is `true`, it evaluates `answer1` and returns its value; otherwise, it evaluates `answer2` and returns its value.
 
 */
var today = "Saturday"

var someText = today == "Saturday" ? "Yes" : "No"


let fuelPrice = 135.9

var message = fuelPrice > 150 ? "expensive" : "cheap"

/*:
 The above is equivalent to the following:
 
 */
if fuelPrice > 150 {
    message = "expensive"
} else {
    message = "cheap"
}

/*:
 - note:
 The ternary conditional operator can be efficient shorthand, however it can lead to hard-to-read code if overused.\
 \
 Avoid combining multiple instances of the ternary conditional operator into one compound statement.
 
 
 - - -
 
 ### Switch
 
 A `switch` statement considers a value and compares it against several possible matching patterns. It then executes an appropriate block of code, based on the first pattern that matches successfully.
 
 A `switch` statement provides an alternative to the `if` statement for responding to multiple potential states.
 
 In its simplest form, a `switch` statement compares a value against one or more values of the same type:
 
 */
let name = "Jane"

switch name {
case "Fred":
    print("Mr Flintstone")
case "Jane":
    print("Mrs Jetson")
default:
    print("007?")
}

today = "foo"

switch today {
case "Monday":
    print("No class today")
case "Tuesday":
    print ("Class today")
case "Wednesday":
    print ("No class today")
default:
    print ("Didn't enter a valid day!")
}

/*:
 Like the body of an `if` statement, each `case` is a separate branch of code execution.
 
 The `switch` statement determines which branch should be selected. This procedure is known as *switching* on the value that is being considered.
 
 - important:
 Every `switch` statement must be *exhaustive*.\
 \
 That is, every possible value of the type being considered must be matched by one of the switch cases.\
 \
 If it’s not appropriate to provide a case for every possible value, you can define a default case to cover any values that are not addressed explicitly.\
 \
 This default case is indicated by the `default` keyword, and **must always appear last**.
 
 
 - - -
 
 ### Compound Cases
 
 Multiple `switch` cases that share the same body can be combined by writing several patterns after `case`, with a comma between each of the patterns.
 
 If any of the patterns match, then the `case` is considered to match. The patterns can be written over multiple lines if the list is long. For example:
 
 */
let someCharacter: Character = "e"

switch someCharacter {
case "a", "e", "i", "o", "u":
    print("\(someCharacter) is a vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
     "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
    print("\(someCharacter) is a consonant")
default:
    print("\(someCharacter) is not a vowel or a consonant")
}

/*:
 - - -
 
 ### Interval Matching
 
 Values in `switch` cases can be checked for their inclusion in a range. For example:
 
 */
let approximateCount = 50
let countedThings = "m&ms in that jar!"
var naturalCount: String

switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<6:
    naturalCount = "a few"
case 6..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "too many"
}

print("There are \(naturalCount) \(countedThings).")

//: [Next](@next)
