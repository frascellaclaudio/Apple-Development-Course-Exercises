import Foundation
/*:
 [Previous](@previous)
 
 # Swift Essentials
 ## 13. Classes & Structures
 
 *Classes* and *structures* are general-purpose, flexible constructs that become the building blocks of your program’s code. You define properties and methods to add functionality to your classes and structures by using exactly the same syntax as for constants, variables, and functions.
 
 - note:
 An instance of a *class* is traditionally known as an object.
 
 - - -
 
 ### Definition Syntax
 
 Classes and structures have a similar definition syntax. You introduce classes with the `class` keyword and structures with the `struct` keyword.
 
 Both place their entire definition within a pair of braces:
 
 */
class SomeClass {
    // class definition goes here
}

struct SomeStructure {
    // structure definition goes here
}

/*:
 - note:
 Whenever you define a new class or structure, you effectively define a brand new Swift type.\
 \
 Give types PascalCase names, such as `SomeClass` and `SomeStructure` above.
 
 
 Here’s an example of a structure definition and a class definition:
 */
struct Resolution {
    var width = 0
    var height = 0
}

class MobileDevice {
    var resolution = Resolution()
    var name: String?
    var screenSize = 0.0
}

/*:
 The example above defines a new structure called `Resolution`, to describe a pixel-based display resolution. This structure has two stored properties called `width` and `height`. Stored properties are constants or variables that are bundled up and stored as part of the class or structure.
 
 It also defines a new class called `MobileDevice`, to describe a specific mobile device. This class has three variable stored properties. The first, `resolution`, is initialised with a new `Resolution` structure instance, which infers a property type of `Resolution`. For the other two properties, new `MobileDevice` instances will be initialised with a `screenSize` of `0.0`, and an optional `String` value called `name`. The `name` property is automatically given a default value of `nil`, or “no name value”, because it is of an optional type.
 
 - - -
 
 ### Class and Structure Instances
 
 The `Resolution` structure definition and the `MobileDevice` class definition only describe what a `Resolution` or `MobileDevice` will look like. They themselves do not describe a specific resolution or mobile device. To do that, you need to create an instance of the structure or class.
 
 The syntax for creating instances is very similar for both structures and classes:
 
 */
let someResolution = Resolution()
let someMobileDevice = MobileDevice()

/*:
 Structures and classes both use initialiser syntax for new instances. The simplest form of initialiser syntax uses the type name of the class or structure followed by empty parentheses, such as `Resolution()` or `MobileDevice()`. This creates a new instance of the class or structure, with any properties initialised to their default values.
 
 
 - - -
 
 ### Accessing Properties
 
 You can access the properties of an instance using dot syntax. In dot syntax, you write the property name immediately after the instance name, separated by a period (`.`), without any spaces:
 
 */
print("The width of someResolution is \(someResolution.width)")

/*:
 In this example, `someResolution.width` refers to the `width` property of `someResolution`, and returns its default initial value of `0`.
 
 You can drill down into sub-properties, such as the `width` property in the `resolution` property of a `MobileDevice`:
 
 */
print("The width of someMobileDevice is \(someMobileDevice.resolution.width)")

/*:
 You can also use dot syntax to assign a new value to a variable property:
 
 */
someMobileDevice.resolution.width = 1920
print("The width of someMobileDevice is now \(someMobileDevice.resolution.width)")

/*:
 - - -
 
 ### Initialisation
 
 *Initialisation* is the process of preparing an instance of a class or structure for use. This process involves setting an initial value for each stored property on that instance and performing any other setup or initialisation that is required before the new instance is ready for use.
 
 You implement this initialisation process by defining initialisers, which are like special methods that can be called to create a new instance of a particular type.
 
 
 ### Setting Initial Values for Stored Properties
 
 Classes and structures must set all of their stored properties to an appropriate initial value by the time an instance of that class or structure is created. Stored properties cannot be left in an indeterminate state.
 
 You can set an initial value for a stored property within an initialiser, or by assigning a default property value as part of the property’s definition.
 
 
 ### Memberwise Initialisers for Structure Types
 
 All structures have an automatically-generated memberwise initialiser, which you can use to initialise the member properties of new structure instances. Initial values for the properties of the new instance can be passed to the memberwise initialiser by name:
 
 */
let tenEighty = Resolution(width: 1920, height: 1080)

/*:
 - note:
 Unlike structures, class instances do not receive a default memberwise initialiser.
 
 
 - - -
 
 ### Initialisers
 
 Initialisers are called to create a new instance of a particular type. In its simplest form, an initialiser is like an instance method with no parameters, written using the `init` keyword:
 
 */
class Colour {
    var r, g, b : Int
    
    init(r: Int, g: Int, b: Int) {
        self.r = r
        self.g = g
        self.b = b
    }
}

let myColour = Colour(r: 170, g: 67, b: 120)

/*:
 - note:
 The `self` keyword refers to the instance, in the example above, `self` refers to the `Colour` instance.\
 \
 We need to use it when the initialiser parameters have the same name as the instances stored properties, in order to determine which one we are referring to.
 
 - - -
 
 ### Structures Are Value Types
 
 A value type is a type whose value is **copied** when it is assigned to a variable or constant, or when it is passed to a function.
 
 You’ve actually been using value types extensively throughout the previous chapters. In fact, all of the basic types in Swift — integers, floating-point numbers, Booleans, strings, arrays and dictionaries — are value types, and are implemented as structures behind the scenes.
 
 Consider this example, which uses the `Resolution` structure:
 
 */
let hd = Resolution(width: 1920, height: 1080)
var cinema = hd

/*:
 Because `Resolution` is a structure, a **copy** of the existing instance is made, and this new copy is assigned to `cinema`. Even though `hd` and `cinema` now have the same `width` and `height`, they are two completely different instances behind the scenes.
 
 */
cinema.width = 2048
print("cinema is now \(cinema.width) pixels wide")
print("hd is still \(hd.width) pixels wide")

/*:
 - - -
 
 ### Classes Are Reference Types
 
 Unlike value types, reference types are **not** copied when they are assigned to a variable or constant, or when they are passed to a function. Rather than a copy, a *reference* to the same existing instance is used instead.
 
 Here’s an example, using the `MobileDevice` class defined above:
 
 */
let iPhone7 = MobileDevice()
iPhone7.resolution = hd
iPhone7.screenSize = 5.5
iPhone7.name = "iPhone 7"

let mobilePhone = iPhone7
mobilePhone.resolution = Resolution(width: 750, height: 1334)
mobilePhone.screenSize = 4.7

print("The screenSize property of iPhone7 is now \(iPhone7.screenSize)")
print("The resolution of iPhone7 is now \(iPhone7.resolution.width) x \(iPhone7.resolution.height)")
/*:
 - - -
 
 ### Identity Operators
 
 Because classes are reference types, it is possible for multiple constants and variables to refer to the same single instance of a class behind the scenes. (The same is not true for structures, because they are always copied when they are assigned to a constant or variable, or passed to a function.)
 
 It can sometimes be useful to find out if two constants or variables refer to exactly the same instance of a class. To do this, Swift provides two identity operators:
 
 - Identical to (`===`)
 - Not identical to (`!==`)
 
 Use these operators to check whether two constants or variables refer to the same single instance:
 
 */
if iPhone7 === mobilePhone {
    print("iPhone7 and mobilePhone refer to the same MobileDevice instance.")
}

/*:
 - - -
 
 ### Instance Methods
 
 Instance methods are functions that belong to instances of a particular class or structure. They support the functionality of those instances, either by providing ways to access and modify instance properties, or by providing functionality related to the instance’s purpose. Instance methods have exactly the same syntax as functions.
 
 You write an instance method within the opening and closing braces of the type it belongs to. An instance method has implicit access to all other instance methods and properties of that type. An instance method can be called only on a specific instance of the type it belongs to. It cannot be called in isolation without an existing instance.
 
 Here’s an example that defines a simple `Counter` class, which can be used to count the number of times an action occurs:
 
 */
class Counter {
    var count = 0
    
    func increment() {
        count += 1
    }
    
    func increment(by amount: Int) {
        count += amount
    }
    
    func reset() {
        count = 0
    }
}

/*:
 You call instance methods with the same dot syntax as properties:
 
 */
let counter = Counter()     // the initial counter value is 0
counter.increment()         // the counter's value is now 1
counter.increment(by: 5)    // the counter's value is now 6
counter.reset()             // the counter's value is now 0

/*:
 - - -
 
 ### Type Properties
 
 Instance properties are properties that belong to an instance of a particular type. Every time you create a new instance of that type, it has its own set of property values, separate from any other instance.
 
 You can also define properties that belong to the type itself, not to any one instance of that type. There will only ever be one copy of these properties, no matter how many instances of that type you create. These kinds of properties are called type properties.
 
 You define type properties with the `static` keyword:
 
 */
class AnotherClass {
    static var someTypeProperty = "Some value"
    var someProperty = ""
}

let class1 = AnotherClass()
class1.someProperty = "one"

let class2 = AnotherClass()
class2.someProperty = "two"

AnotherClass.someTypeProperty = "A different value"

class2.someProperty
class1.someProperty
AnotherClass.someTypeProperty = "new Value"

AnotherClass.someTypeProperty
/*:
 - important:
 Type properties can only be accessed via the type itself!\
 They will not appear via an instance of the type.
 
 

 - - -
 
 [Next](@next)
 */
