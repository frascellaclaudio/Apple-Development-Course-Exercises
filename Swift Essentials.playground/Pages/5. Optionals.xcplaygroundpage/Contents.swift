import Foundation
/*:
 [Previous](@previous)
 
 # Swift Essentials
 ## 5. Optionals
 
 Swift features optionals that can be used in situations where a value may be absent.
 
 An optional represents two possibilities: Either there *is* a value, and you can unwrap the optional to access that value, or there *isn’t* a value at all.
 
 ### Nil
 
 Let's first talk about `nil`. Any optional type or reference value in Swift can have a value of `nil`.
 
 Technically `nil` isn't even a value, it's nothing!
 
 */
var anOptionalInt: Int?

print(anOptionalInt)

/*:
 - - -
 
 ### Optional Types
 
 An optional `Int` is written as `Int?`, not `Int`.
 
 The question mark indicates that the value it contains is *optional*, meaning that it might contain some `Int` value, or it might contain no value at all (`nil`).
 
 It can’t contain anything else, such as a `Bool` value or a `String` value.
 
 It’s either an `Int`, or it’s nothing at all.
 
 ![IMAGE Optional Int](optional-int.png)
 
 - - -
 
 ### If Statements
 
 You can use an `if` statement to find out whether an optional contains a value by comparing the optional against `nil`.
 
 You perform this comparison with the “equal to” operator (`==`) or the “not equal to” operator (`!=`).
 
 If an optional has a value, it is considered to be “not equal to” `nil`:
 
 */
var firstName: String? = "Claire"

if firstName != nil {
    print("Hello \(firstName)")
}

/*:
 - note:
 Swift and Xcode provide warnings when using optionals incorrectly.\
 \
 `... optional value; did you mean to make this explicit?`\
 \
 Also see how it prints `Optional("Claire")`.
 
 - - -
 
 ### Forced (Explicit) Unwrapping
 
 Once you’re sure that the optional does contain a value, you can access its underlying value by adding an exclamation mark (`!`) to the end of the optional’s name.
 
 The exclamation mark effectively says, “I know that this optional definitely has a value; use it!”
 
 This is known as forced unwrapping of the optional’s value:
 
 */
var lastName: String?

if lastName != nil {
    print("Is your surname still \(lastName!)?")
}

/*:
 - experiment:
 What happens if we force unwrap `lastName` when it is `nil`?
 
 - experiment:
 Assign a value to `lastName` above. What does it print?
 
 - - -
 
 ### Nil-Coalescing Operator
 
 The *nil-coalescing operator* (`a ?? b`) unwraps an optional `a` if it contains a value, or returns a **default** value `b` if `a` is `nil`.
 
 - The expression `a` is always of an optional type.
 - The expression `b` must match the type that is stored inside `a`.
 
 The nil-coalescing operator is shorthand for the code below:
 
 */
var a: Int?
let b = 3

var anInt = a != nil ? a! : b   // Using the ternary conditional operator

anInt = a ?? b                  // Using the nil-coalescing operator

/*:
 Here's another example:
 
 */
var userColour: String?

let backgroundColour = userColour ?? "white"

/*:
 - experiment:
 Assign a value to `userColour` above.
 
 
 - - -
 
 ### Optional Binding
 
 You use *optional binding* to find out whether an optional contains a value, and if so, to make that value available as a temporary constant or variable.
 
 Optional binding can be used with `if` statements to check for a value inside an optional, and to extract that value into a constant or variable, as part of a single action.
 
 We can rewrite the `lastName` example to use optional binding, rather than forced unwrapping:
 
 ````
 var lastName: String?
 
 if lastName != nil {
    print("Is your surname still \(lastName!)?")
 }
 ````
 
 */
if let surname = lastName {
    print("Is your surname still \(surname)?")
}

/*:
 - note:
 Simply put, if optional `lastName` has a value, let's assign that value to a constant `surname` that we can use within the if statements code block.\
 \
 If `lastName` is `nil`, don't bother doing anything.
 
 */

//: [Next](@next)
