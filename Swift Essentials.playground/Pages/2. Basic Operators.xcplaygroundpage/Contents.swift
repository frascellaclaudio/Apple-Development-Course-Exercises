/*:
 [Previous](@previous)
 
 # Swift Essentials
 ## 2. Basic Operators
 
 An *operator* is a special symbol or phrase that you use to check, change, or combine values. For example, the addition operator (`+`) adds two numbers, as in `let i = 1 + 2`, and the logical AND operator (`&&`) combines two Boolean values, as in `if enteredDoorCode && passedRetinaScan`.
 
 ### Assignment Operator
 
 The *assignment operator* (`a = b`) initialises or updates the value of `a` with the value of `b`:
 
 */
let b = 10
var a = 5
a = b   // a is now equal to 10

/*:
 ### Arithmetic Operators
 
 Swift supports the four standard *arithmetic operators* for all number types:
 
 - Addition (`+`)
 - Subtraction (`-`)
 - Multiplication (`*`)
 - Division (`/`)
 
 */
1 + 2       // equals 3
5 - 3       // equals 2
2 * 3       // equals 6
10.0 / 2.5  // equals 4.0

/*:
 - note:
 The addition operator is also supported for `String` concatenation:
 
 */
"hello, " + "world"  // equals "hello, world"

/*:
 ### Remainder Operator
 
 The *remainder operator* (`a % b`) works out how many multiples of `b` will fit inside `a` and returns the value that is left over (*known as the remainder*).
 
 Here’s how the remainder operator works. To calculate `9 % 4`, you first work out how many `4`s will fit inside `9`:
 
 ![remainder of 9 % 4](remainder.png)
 
 You can fit two `4`s inside `9`, and the remainder is `1` (shown in orange).
 
 In Swift, this would be written as:
 
 */
9 % 4    // equals 1

/*:
 ### Compound Assignment Operators
 
 Swift provides *compound assignment operators* that combine assignment (`=`) with another operation. One example is the addition assignment operator (`+=`):
 
 */
var c = 1
c += 2     // c is now equal to 3

/*:
 The expression `c += 2` is shorthand for `c = c + 2`. Effectively, the addition and the assignment are combined into one operator that performs both tasks at the same time.
 
 
 ### Comparison Operators
 
 Swift supports all standard *comparison operators*:
 
 - Equal to (`a == b`)
 - Not equal to (`a != b`)
 - Greater than (`a > b`)
 - Less than (`a < b`)
 - Greater than or equal to (`a >= b`)
 - Less than or equal to (`a <= b`)
 
 Each of the comparison operators returns a `Bool` value to indicate whether or not the statement is true:
 
 */
1 == 1   // true because 1 is equal to 1
2 != 1   // true because 2 is not equal to 1
2 > 1    // true because 2 is greater than 1
1 < 2    // true because 1 is less than 2
1 >= 1   // true because 1 is greater than or equal to 1
2 <= 1   // false because 2 is not less than or equal to 1

/*:
 Comparison operators are often used in conditional statements, such as the `if` statement:
 
 */
let count = 3
if count <= 5 {
    print("true, \(count) is less than or equal to 5")
}

/*:
 ### Logical Operators
 
 *Logical operators* modify or combine the Boolean logic values `true` and `false`. Swift supports three standard logical operators:
 
 - Logical NOT (`!a`)
 - Logical AND (`a && b`)
 - Logical OR (`a || b`)
 
 ### Logical NOT Operator
 
 The *logical NOT operator* (`!a`) inverts a Boolean value so that `true` becomes `false`, and `false` becomes `true`.
 
 The logical NOT operator is a prefix operator, and appears immediately before the value it operates on, without any white space. It can be read as “not `a`”, as seen in the following example:
 
 */
let allowedEntry = false
if !allowedEntry {
    print("ACCESS DENIED")
}

/*:
 The phrase `if !allowedEntry` can be read as “if not allowed entry.” The subsequent line is only executed if “not allowed entry” is `true`; that is, if `allowedEntry` is `false`.
 
 ### Logical AND Operator
 
 The *logical AND operator* (`a && b`) creates logical expressions where both values **must** be `true` for the overall expression to also be `true`.
 
 If either value is `false`, the overall expression will also be `false`.
 
 This example considers two `Bool` values and only allows access if both values are `true`:
 
 */
let enteredDoorCode = true
let passedRetinaScan = false
if enteredDoorCode && passedRetinaScan {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}

/*:
 ### Logical OR Operator
 
 The *logical OR operator* (`a || b`) is used to create logical expressions in which only one of the two values has to be `true` for the overall expression to be `true`.
 
 In the example below, the first `Bool` value (`hasDoorKey`) is `false`, but the second value (`knowsOverridePassword`) is `true`.
 
 Because one value is `true`, the overall expression also evaluates to `true`, and access is allowed:
 
 */
let hasDoorKey = false
let knowsOverridePassword = true
if hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}

/*:
 ### Combining Logical Operators
 
 You can combine multiple logical operators to create longer expressions:
 
 */
if enteredDoorCode && passedRetinaScan || hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}

/*:
 This example uses multiple `&&` and `||` operators to create a longer expression.
 
 The `&&` and `||` operators still operate on only two values, so this is actually three smaller expressions chained together. The example can be read as:
 
 - If we’ve entered the correct door code AND passed the retina scan
 - OR if we have a valid door key
 - OR if we know the emergency override password
 
 then allow access.
 
 ### Explicit Parentheses
 
 Sometimes it is useful to include parentheses when they are not strictly needed, to make a complex expression easier to read. The door access example above could be written:
 
 */
if (enteredDoorCode && passedRetinaScan) || hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}


//: [Next](@next)
