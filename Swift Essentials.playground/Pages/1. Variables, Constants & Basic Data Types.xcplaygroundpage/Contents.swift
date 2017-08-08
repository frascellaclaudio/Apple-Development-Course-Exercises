/*:
 [Previous](@previous)
 
 # Swift Essentials
 ## 1. Variables, Constants & Basic Data Types
 
 ### What are Variables & Constants
 
 Variables and constants associate a name (such as `maximumNumberOfLoginAttempts` or `welcomeMessage`) with a value of a particular type (such as the number `10` or the string `"Hello"`).
 
 The value of a *constant* cannot be changed once it is set, whereas a *variable* can be set to a different value in the future.
 
 Variables and constants occupy a portion of memory to store a value that can be referenced by the associated name.
 
 ![IMAGE Memory & Variable](mem-var.png)
 
 - important:
 Variable and constant names should use **camelCase** where the first word is lower-case, and the first letter of any word/s thereafter is a capital letter.\
 \
 Names cannot contain whitespace characters, mathematical symbols or arrow characters. Nor can they begin with a number, although numbers may be included elsewhere within the name.\
 \
 Once you’ve declared a constant or variable of a certain type, you can’t redeclare it again with the same name, or change it to store values of a different type. Nor can you change a constant into a variable or a variable into a constant.
 
 ![IMAGE camelCase](camel-vs-pascal.png)
 
 - - -
 
 ### Basic Data Types
 
 All programming languages have *data types* that are used to classify a particular type of data or piece of information such as:
 
 - Integers
 - Floating-Point Numbers
 - Booleans
 - Strings
 - Characters
 
 - - -
 
 ### Integers
 
 Integers are whole numbers with no fractional component, such as `32` or `-18`. Integers are either *signed* (negative, zero or positive) or *unsigned* (zero or positive).
 
 */
let minInt32Value = Int32.min   // A 32-bit Int has a minimum value of -2,147,483,648
let maxInt32Value = Int32.max   // A 32-bit Int has a maximum value of  2,147,483,647

let minInt64Value = Int64.min   // A 64-bit Int has a maximum value of -9,223,372,036,854,775,808
let maxInt64Value = Int64.max   // A 64-bit Int has a maximum value of  9,223,372,036,854,775,807

let minIntValue = Int.min       // Int automatically uses the current platforms native size
let maxIntValue = Int.max       // 32-bit (billions) and 64-bit (quintillions)

/*:
 - note:
 Even on 32-bit platforms, an `Int` can store a large enough whole number for many integer ranges.\
 \
 Did you know (in 2017) Earth has around 7.5 billion people?
 
 */
let minUIntValue = UInt.min     // An Unsigned Int (UInt) minimum value
let maxUIntValue = UInt.max     // An Unsigned Int (UInt) maximum Value

/*:
 - - -
 
 ### Floating-Point Numbers
 
 Floating-point numbers are numbers with a fractional component, such as `3.14159`, `0.1` or `-273.15`.
 
 Floating-point types can represent a much wider range of values than integer types, and can store numbers that are much larger or smaller than can be stored in an `Int`. Swift provides two signed floating-point number types:
 
 - `Double` represents a 64-bit floating-point number.
 - `Float` represents a 32-bit floating-point number.
 
 - note:
 `Double` has a precision of at least 15 decimal digits, whereas the precision of `Float` can be as little as 6 decimal digits. The appropriate floating-point type to use depends on the nature and range of values you need to work with in your code. In situations where either type would be appropriate, `Double` is preferred.\
 \
 Swift always chooses `Double` (rather than `Float`) when *inferring* the type of floating-point numbers.
 
 */
let pi = 3.14159

/*:
 - - -
 
 ### Booleans
 
 Swift has a basic *Boolean* type, called `Bool`. Boolean values are referred to as *logical*, because they can only ever be true or false. Swift provides two Boolean constant values, `true` and `false`:
 
 */
let applesAreApples = true
let banannasArePears = false

/*:
 - note:
 Boolean values are particularly useful when you work with conditional statements such as the `if` statement:
 */
if applesAreApples {
    print("Yeah, of course they are!")
} else {
    print("No... Don't know what planet you're from.")
}

/*:
 - experiment:
 Change `let applesAreApples = true` to `let applesAreApples = false` above to see what prints to the console.
 
 - - -
 
 ### Strings
 
 A *string* is a series of characters, such as `"hello, world"` or `"apple"`. Swift strings are represented by the `String` type.
 
 A *string literal* is a fixed sequence of textual characters surrounded by a pair of double quotes (`""`).
 
 */
let someString = "Some string literal value"

/*:
 ### Initialising an Empty String
 
 To create an empty `String` value as the starting point for building a longer string, simply assign an empty string literal to a variable.
 
 */
var emptyString = ""

/*:
 - note:
 You can check whether a `String` value is empty by checking its Boolean `isEmpty` property:
 
 */
if emptyString.isEmpty {
    print("Nothing to see here")
}

/*:
 - experiment:
 Change the value of `emptyString` from `""` to some string literal above to see if `Nothing to see here` prints to the console.
 
 - - -
 
 ### Characters
 
 A *character* is a single-character string literal. You can create a stand-alone `Character` constant or variable by providing a `Character` type annotation:
 
 */
let exclamationMark: Character = "!"

/*:
 - experiment:
 What happens if you try to change the value of `exclamationMark` to contain more than 1 character?
 
 - - -
 
 ### Declaring Constants and Variables
 
 Constants and variables must be declared before they are used. As you may have noticed from the examples above, you declare constants with the `let` keyword and variables with the `var` keyword.
 
 Here’s an example of how constants and variables can be used to track the number of login attempts a user has made:
 
 */
let maximumNumberOfLoginAttempts = 10
var currentLoginAttempt = 0
 
/*:
 This code can be read as:
 
 “Declare a new constant called `maximumNumberOfLoginAttempts`, and assign it a value of `10`. Then, declare a new variable called `currentLoginAttempt`, and give it an initial value of `0`.”
 
 In this example, the maximum number of allowed login attempts is declared as a **constant**, because the maximum value never changes. The current login attempt counter is declared as a **variable**, because this value must be incremented after each failed login attempt.
 
 - experiment:
 Remember the value of a *constant* cannot be changed once it is set!\
 \
 So what happens if you un-comment the lines of code below?
 
 */
//maximumNumberOfLoginAttempts = 3
//currentLoginAttempt = 2

/*:
 - note:
 Once a constant or variable is declared using the `let` or `var` keywords, we can access them later simply by the name.
 
 - - -
 
 ### Type Annotation
 
 You can provide a *type annotation* when you declare a constant or variable, to be clear about the kind of values the constant or variable can store. Write a type annotation by placing a colon after the constant or variable name, followed by a space, followed by the name of the type to use.
 
 This example provides a type annotation for a variable called `welcomeMessage`, to indicate that the variable can store `String` values:
 
 */
var welcomeMessage: String

/*:
 The colon in the declaration means *“…of type…,”* so the code above can be read as:
 
 “Declare a variable called `welcomeMessage` that is of type `String`.”
 
 The phrase “of type `String`” means “can store any `String` value.”
 
 The `welcomeMessage` variable can now be set to any string value without error:
 
 */
welcomeMessage = "Hello"

/*:
 - important:
 Notice that we declare the `welcomeMessage` variable above with the `var` keyword, however we didn't assign a value to it straight away. In this case, we **must** declare its type!
 
 
 - experiment:
 What happens if you try to assign a data type value other than a `String` to `welcomeMessage` above?\
 \
 For example: `welcomeMessage = 104.1` or `welcomeMessage = true`
 
 */
let count: Int
var changeDue: Double = 10
let cat: Character = "😺"
var isUpsized: Bool

/*:
 - - -
 
 ### Type Inferance
 
 The data types of constants and variables can be *inferred* from the value that they were initialised with.
 
 Type inference helps make Swift code more concise and readable when it initialises constants or variables with values whose type is already known.
 
 For example:
 
 */
let firstName = "Lee"   // firstName  is of type String
let dollarSign = "$"    // dollarSign is of type String
let fanCount = 7        // fanCount   is of type Int
let taxRate = 0.10      // taxRate    is of type Double
let isHappy = true      // isHappy    is of type Bool

/*:
 - note:
 You can see a constant or variables definition by holding `Option` (Alt) + clicking on the name.
 
 
 - important:
 Notice how any text within double quotes (`""`) is inferred to be a `String`, even if the value is only 1 character.\
 Also any floating-point number is inferred to be a `Double`.
 
 */

//: [Next](@next)
