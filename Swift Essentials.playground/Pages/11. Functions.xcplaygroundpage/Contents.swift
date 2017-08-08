import Foundation
/*:
 [Previous](@previous)
 
 # Swift Essentials
 ## 11. Functions
 
 Functions are self-contained blocks of code that perform a specific task.
 
 You give a function a name that identifies what it does, and this name is used to “call” the function to perform its task when needed.
 
 - - -
 
 ### Defining and Calling Functions
 
 When you define a function, you can optionally define one or more named, typed values that the function takes as input, known as *parameters*.
 
 You can also optionally define a type of value that the function will pass back as output when it is done, known as its *return type*.
 
 Every function has a function name, which describes the task that the function performs.
 
 To use a function, you “call” that function with its name and pass it input values (known as arguments) that match the types of the function’s parameters.
 
 The function in the example below is called `sayHello(to:)`, because that’s what it does.
 
 It defines one input parameter (a `String` value called `to`) and a return type of `String`:
 
 */
func sayHello(to: String) -> String {
    return "Hello, \(to)!"
}

/*:
 All of this information is rolled up into the function’s *definition*, which is prefixed with the `func` keyword.
 
 You indicate the function’s return type with the return arrow `->` (a hyphen followed by a right angle bracket), which is followed by the name of the type to return.
 
 The definition describes what the function does, what it expects to receive, and what it returns when it is done.
 
 The definition makes it easy for the function to be called explicitly from elsewhere in your code:
 
 */
let greeting = sayHello(to: "Lee")

print(sayHello(to: "Claire"))

/*:
 
 - - -
 
 ### Function Parameters and Return Values
 
 Function parameters and return values are extremely flexible in Swift. You can define anything from a simple utility function with a single unnamed parameter to a complex function with expressive parameter names and different parameter options.
 
 
 ### Functions Without Parameters
 
 Functions are **not** required to define input parameters. Here’s a function with no input parameters, which always returns the same `String` message whenever it is called:
 
 */
func sayHelloWorld() -> String {
    return "Hello, world!"
}

sayHelloWorld()

/*:
 - note:
 The function definition still needs parentheses after the function’s name, even though it does not take any parameters. The function name is also followed by an empty pair of parentheses when the function is called.
 
 
 - - -
 
 ### Functions With Multiple Parameters
 
 Functions can have multiple input parameters, which are written within the function’s parentheses, separated by commas:
 
 */
func multiply(a: Int, b: Int) -> Int {
    return a * b
}

let result = multiply(a: 3, b: 2)

/*:
 Let's consider another example:
 
 */
func sayHelloAgain(to: String) -> String {
    return "Hello again, \(to)!"
}

func sayHello(to: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return sayHelloAgain(to: to)
    } else {
        return sayHello(to: to)
    }
}

let message = sayHello(to: "Lee", alreadyGreeted: true)

/*:
 - note:
 Functions can call other functions, and/or return another functions result providing the return types are the same.
 
 
 - important:
 Although both functions have names that begin with `sayHello`, the `sayHello(to:alreadyGreeted:)` function takes two arguments but the `sayHello(to:)` function takes only one.
 
 - - -
 
 ### Functions Without Return Values
 
 Functions are **not** required to define a return type. Here’s an example which prints its own result rather than returning it.
 
 Because it does not need to return a value, the function’s definition does not include the return arrow (`->`) or a return type:
 
 */
func average(numbers: [Int]) {
    var total = 0
    for num in numbers {
        total += num
    }
    print("The average is \(total / numbers.count)")
}

average(numbers: [12, 22, 67, 4, 97])

/*:
 - note:
 Functions without a defined return type return a special value of type `Void`.
 
 
 - - -
 
 ### Functions with Multiple Return Values
 
 You can use a tuple type as the return type for a function to return multiple values as part of one compound return value.
 
 The example below defines a function called `minMax(array:)`, which finds the smallest and largest numbers in an array of `Int` values:
 
 */
func minMax(array: [Int]) -> (min: Int, max: Int) {
    if !array.isEmpty {
        return (array.min()!, array.max()!)
    }
    return (0, 0)
}

let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
print("min is \(bounds.min) and max is \(bounds.max)")

/*:
 - note:
 Tuples group multiple values into a single compound value. The values within a tuple can be of any type and do not have to be of the same type as each other.\
 \
 You also do not need to name the individual elements, however to access them, they have an index similar to an array 0 ... x:
 
 */
let myTuple = ("Swift", 3.1)
print("I am learning \(myTuple.0) v\(myTuple.1)")

/*:
 - - -
 
 ### Function Argument Labels and Parameter Names
 
 Each function parameter has both an argument label and a parameter name.
 
 The argument label is used when calling the function; each argument is written in the function call with its argument label before it.
 
 The parameter name is used in the implementation of the function. By default, parameters use their parameter name as their argument label.
 
 All parameters must have unique names. Although it’s possible for multiple parameters to have the same argument label, unique argument labels help make your code more readable.
 
 ### Specifying Argument Labels
 
 You write an argument label before the parameter name, separated by a space:
 
 */
func sayHello(to: String, from hometown: String) -> String {
    return "Hello \(to), glad you could visit from \(hometown)!"
}

sayHello(to: "Lee", from: "Sydney")

/*:
 - - -
 
 ### Omitting Argument Labels
 
 If you don’t want an argument label for a parameter, write an underscore (`_`) instead of an explicit argument label for that parameter:
 
 */
func concat(_ a: String, _ b: String) -> String {
    return a + b
}

concat("Hello", " World!")

/*:
 - - -
 
 ### Default Parameter Values
 
 You can define a default value for any parameter in a function by assigning a value to the parameter after that parameter’s type.
 
 If a default value is defined, you can omit that parameter when calling the function:
 
 */
func someFunction(parameterWithoutDefault: Int, parameterWithDefault: Int = 12) {
    print("\(parameterWithoutDefault), \(parameterWithDefault)")
}

someFunction(parameterWithoutDefault: 6, parameterWithDefault: 2)

someFunction(parameterWithoutDefault: 6)

/*:
 - important:
 If providing parameters with default values, be sure to specify them at the end.
 
 
 - - -
 
 ### Variadic Parameters
 
 A *variadic parameter* accepts zero or more values of a specified type.
 
 You use a variadic parameter to specify that the parameter can be passed a varying number of input values when the function is called.
 
 Write variadic parameters by inserting three period characters (`...`) after the parameter’s type name.
 
 The values passed to a variadic parameter are made available within the function’s body as an array of the appropriate type.
 
 For example, a variadic parameter with a name of `numbers` and a type of `Double...` is made available within the function’s body as a constant array called `numbers` of type `[Double]`:
 
 */
func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}

arithmeticMean(1, 2, 3, 4, 5)
arithmeticMean(3, 8.25, 18.75)

/*:
 - note:
 A function may have at most **one** variadic parameter.
 
 
 - - -
 
 ### In-Out Parameters
 
 Function parameters are *constants* by default. Trying to change the value of a function parameter from within the body of that function results in a compile-time error. This means that you can’t change the value of a parameter by mistake.
 
 If you want a function to modify a parameter’s value, and you want those changes to persist after the function call has ended, define that parameter as an in-out parameter instead.
 
 You write an in-out parameter by placing the `inout` keyword right before a parameter’s type. An in-out parameter has a value that is passed *in* to the function, is modified by the function, and is passed back *out* of the function to replace the original value.
 
 You can only pass a variable as the argument for an in-out parameter. You cannot pass a constant or a literal value as the argument, because constants and literals cannot be modified.
 
 You place an ampersand (`&`) directly before a variable’s name when you pass it as an argument to an in-out parameter, to indicate that it can be modified by the function:
 
 */
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var one = 1, two = 2

swapTwoInts(&one, &two)

print("one = \(one) and two = \(two)")

/*:
 - note:
 In-out parameters cannot have default values, and variadic parameters cannot be marked as `inout`.
 
 
 - - -
 
 ### Function Types
 
 Every function has a specific function type, made up of the parameter types and the return type of the function.
 
 For example:
 
 */
func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}

func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}

/*:
 The type of both of these functions is `(Int, Int) -> Int`.
 
 This can be read as:
 
 "A function type that has two parameters, both of type `Int`, and that returns a value of type `Int`."
 
 Here’s another example, for a function with no parameters or return value:
 
 */
func doSomething() {
    // ...
}

/*:
 The type of this function is `() -> Void`, or "a function that has no parameters, and returns `Void`."
 
 - - -
 
 ### Using Function Types
 
 You use function types just like any other types in Swift. For example, you can define a constant or variable to be of a function type and assign an appropriate function to that variable:
 
 */
var mathFunction: (Int, Int) -> Int = addTwoInts

print("Result: \(mathFunction(2, 3))")

mathFunction = multiplyTwoInts

print("Result: \(mathFunction(2, 3))")

/*:
 - - -
 
 ### Function Types as Parameter Types
 
 You can use a function type such as `(Int, Int) -> Int` as a parameter type for another function. This enables you to leave some aspects of a function’s implementation for the function’s caller to provide when the function is called:
 
 */
func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}

printMathResult(addTwoInts, 2, 5)

/*:
 - - -
 
 ### Function Types as Return Types
 
 You can use a function type as the return type of another function. You do this by writing a complete function type immediately after the return arrow (->) of the returning function.
 
 */
func stepForward(_ input: Int) -> Int {
    return input + 1
}

func stepBackward(_ input: Int) -> Int {
    return input - 1
}

func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    return backward ? stepBackward : stepForward
}

var currentValue = 3

let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
// moveNearerToZero now refers to the stepBackward() function

print("Counting to zero:")

while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")

/*:
 - - -
 
 [Next](@next)
 */
