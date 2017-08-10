import Foundation
/*:
 [Previous](@previous)
 
 # Swift Essentials
 ## 17. Protocols
 
 A *protocol* defines a blueprint of methods, properties, and other requirements that suit a particular task or piece of functionality.
 
 The protocol can then be *adopted* by a class or structure to provide an actual implementation of those requirements.
 
 Any type that satisfies the requirements of a protocol is said to *conform* to that protocol.
 
 - - -
 
 ### Protocol Syntax
 
 You define protocols in a very similar way to classes and structures:
 
 */
protocol SomeProtocol {
    // protocol definition goes here
}

/*:
 Custom types state that they adopt a particular protocol by placing the protocol’s name after the type’s name, separated by a colon, as part of their definition.
 
 Multiple protocols can be listed, and are separated by commas:
 
 ````
 struct SomeStructure: FirstProtocol, AnotherProtocol {
    // structure definition goes here
 }
 ````
 
 If a class has a superclass, list the superclass name before any protocols it adopts, followed by a comma:
 
 ````
 class SomeClass: SomeSuperclass, FirstProtocol, AnotherProtocol {
    // class definition goes here
 }
 ````
 
 - - -
 
 ### Property Requirements
 
 A protocol can require any conforming type to provide an instance property or type property with a particular name and type.
 
 The protocol doesn’t specify whether the property should be a stored property or a computed property — it only specifies the required property name and type.
 
 The protocol also specifies whether each property must be gettable or gettable and settable.
 
 Property requirements are always declared as variable properties, prefixed with the `var` keyword.
 
 Gettable and settable properties are indicated by writing `{ get set }` after their type declaration, and gettable properties are indicated by writing `{ get }`.
 
 */
protocol AnotherProtocol {
    var mustBeSettable: Int { get set }
    var doesNotNeedToBeSettable: Int { get }
}

/*:
 Here’s an example of a protocol with a single instance property requirement:
 
 */
protocol FullyNamed {
    var fullName: String { get }
}

/*:
 - note:
 The `FullyNamed` protocol states that any `FullyNamed` type must have a gettable instance property called `fullName`, which is of type `String`.
 
 Here’s an example of a simple structure that adopts and conforms to the `FullyNamed` protocol:
 
 */
struct Person: FullyNamed {
    var fullName: String
}

let john = Person(fullName: "John Connor")
john.fullName

/*:
 Here’s a more complex class, which also adopts and conforms to the `FullyNamed` protocol:
 
 */
class Starship: FullyNamed {
    var prefix: String?
    var name: String
    
    init(name: String, prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
    }
    
    var fullName: String {
       return (prefix != nil ? prefix! + " " : "") + name
    }
}

var ncc1701 = Starship(name: "Enterprise", prefix: "USS")
ncc1701.fullName

/*:
 - experiment:
 What happens if you comment out the `fullName` computed property above?
 
 - - -
 
 ### Method Requirements
 
 Protocols can require specific instance methods and type methods to be implemented by conforming types. These methods are written as part of the protocol’s definition in exactly the same way as for normal instance and type methods, but without curly braces or a method body. Variadic parameters are allowed, subject to the same rules as for normal methods. Default values, however, cannot be specified for method parameters within a protocol’s definition.
 
 The following example defines a protocol with a single instance method requirement:
 */
protocol Dice {
    func roll() -> Int
}

/*:
 The `Dice` protocol simply requires the adopting class to provide a `roll()` method that returns an `Int`.
 
 Here’s an implementation of a class that adopts and conforms to the `Dice` protocol:
 
 */
class SixSidedDice: Dice {
    func roll() -> Int {
        return Int(arc4random_uniform(6) + 1)
    }
}

let mySixSidedDice = SixSidedDice()

/*:
 - - -
 
 ### Protocols as Types
 
 Protocols do not actually implement any functionality themselves. Nonetheless, any protocol you create will become a fully-fledged type for use in your code.
 
 Because it is a type, you can use a protocol in many places where other types are allowed, including:
 
 - As a parameter type or return type in a function, method, or initialiser
 - As the type of a constant, variable, or property
 - As the type of items in an array, dictionary, or other container
 
 Here’s an example of a protocol used as a type:
 
 */
class Game {
    var dice: Dice
    
    init(dice: Dice) {
        self.dice = dice
    }
    
    func play() -> Int {
        return dice.roll()
    }
}

let someGame = Game(dice: mySixSidedDice)
someGame.play()

class FourSidedDice: Dice {
    func roll() -> Int {
        return Int(arc4random_uniform(4) + 1)
    }
}

let myFourSideDice = FourSidedDice()

let anotherGame = Game(dice: myFourSideDice)
anotherGame.play()

/*:
 - - -
 
 ### Collections of Protocol Types
 
 A protocol can be used as the type to be stored in a collection such as an array or a dictionary.
 
 This example creates an array of `FullyNamed` things:
 
*/
let things: [FullyNamed] = [john, ncc1701]

for thing in things {
    print(thing.fullName)
}

/*:
 - - -
 
 ### Type Casting
 
 Type casting is a way to check the type of an instance, or to treat that instance as a different superclass or subclass from somewhere else in its own class hierarchy.
 
 Type casting in Swift is implemented with the `is` and `as` operators. These two operators provide a simple and expressive way to check the type of a value or cast a value to a different type.
 
 
 ### Defining a Class Hierarchy for Type Casting
 
 You can use type casting with a hierarchy of classes and subclasses to check the type of a particular class instance and to cast that instance to another class within the same hierarchy.
 
 The three code snippets below define a hierarchy of classes and an array containing instances of those classes, for use in an example of type casting.
 
 */
class MediaItem {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

class Movie: MediaItem {
    var director: String
    
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

class Song: MediaItem {
    var artist: String
    
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}

/*:
 The final snippet creates a constant array called `library`, which contains two `Movie` instances and three `Song` instances. The type of the library array is inferred by initialising it with the contents of an array literal. Swift’s type checker is able to determine that `Movie` and `Song` have a common superclass of `MediaItem`, and so it infers a type of `[MediaItem]` for the library array:
 
 */
let library: [MediaItem] = [
    Movie(name: "The Shawshank Redemption", director: "Frank Darabont"),
    Song(name: "Graduate", artist: "Third Eye Blind"),
    Movie(name: "Pulp Fiction", director: "Quentin Tarantino"),
    Song(name: "The Way You Make Me Feel", artist: "Michael Jackson"),
    Song(name: "Lucky Man", artist: "The Verve")
]

/*:
 The items stored in `library` are still `Movie` and `Song` instances behind the scenes. However, if you iterate over the contents of this array, the items you receive back are typed as `MediaItem`, and not as `Movie` or `Song`.
 
 In order to work with them as their native type, you need to check their type, or downcast them to a different type.
 
 - - -
 
 ### Checking Type
 
 Use the type check operator (`is`) to check whether an instance **is** of a certain subclass type. The type check operator returns `true` if the instance is of that subclass type and `false` if it is not:
 
 */
var movieCount = 0
var songCount = 0

for item in library {
    if item is Movie {
        movieCount += 1
    } else if item is Song {
        songCount += 1
    }
}

print("Media library contains \(movieCount) movies and \(songCount) songs")

/*:
 - - -
 
 ### Downcasting
 
 A constant or variable of a certain class type may actually refer to an instance of a subclass behind the scenes. Where you believe this is the case, you can try to downcast to the subclass type with a type cast operator (`as?` or `as!`).
 
 Because downcasting can fail, the type cast operator comes in two different forms:
 
 - The conditional form, `as?`, returns an optional value of the type you are trying to downcast to.
 - The forced form, `as!`, attempts the downcast and force-unwraps the result as a single compound action.
 
 Use the conditional form of the type cast operator (`as?`) when you are not sure if the downcast will succeed. This form of the operator will always return an optional value, and the value will be `nil` if the downcast was not possible. This enables you to check for a successful downcast.
 
 Use the forced form of the type cast operator (`as!`) **only** when you are sure that the downcast will always succeed.
 
 The example below iterates over each `MediaItem` in `library`, and prints an appropriate description for each item. To do this, it needs to access each item as a true `Movie` or `Song`, and not just as a `MediaItem`. This is necessary in order for it to be able to access the `director` or `artist` property of a `Movie` or `Song` for use in the description:
 
 */
for item in library {
    if let movie = item as? Movie {
        print("Movie: \(movie.name), dir. \(movie.director)")
    } else if let song = item as? Song {
        print("Song: \(song.name), by \(song.artist)")
    }
}

/*:
 - note:
 Casting does not actually modify the instance or change its values. The underlying instance remains the same; it is simply treated and accessed as an instance of the type to which it has been cast.
 
 - - -
 
 ### Checking for Protocol Conformance
 
 You can use the is and as operators described in Type Casting to check for protocol conformance, and to cast to a specific protocol. Checking for and casting to a protocol follows exactly the same syntax as checking for and casting to a type:
 
 - The `is` operator returns `true` if an instance conforms to a protocol and returns `false` if it does not.
 - The `as?` version of the downcast operator returns an optional value of the protocol’s type, and this value is `nil` if the instance does not conform to that protocol.
 - The `as!` version of the downcast operator forces the downcast to the protocol type and triggers a runtime error if the downcast does not succeed.
 
 This example defines a protocol called `HasArea`, with a single property requirement of a gettable `Double` property called `area`:
 
 */
protocol HasArea {
    var area: Double { get }
}

/*:
 Here are two classes, `Rectangle` and `Country`, both of which conform to the `HasArea` protocol:
 
 */
class Rectangle: HasArea {
    var width, height: Double
    
    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }
    
    var area: Double {
        return width * height
    }
}

class Country: HasArea {
    var area: Double
    
    init(area: Double) { self.area = area }
}

/*:
 Here’s a class called `Animal`, which does **not** conform to the `HasArea` protocol:
 
 */
class Animal {
    var legs: Int
    
    init(legs: Int) { self.legs = legs }
}

/*:
 The `Rectangle`, `Country` and `Animal` classes do not have a shared base class. Nonetheless, they are all classes, and so instances of all three types can be used to initialise an array that stores values of type `AnyObject`:
 
 */
let objects: [AnyObject] = [
    Rectangle(width: 5.5, height: 7.2),
    Country(area: 15000.7),
    Animal(legs: 4)
]

/*:
 - note:
 `AnyObject` can represent an instance of any class type.\
 \
 Use `AnyObject` only when you explicitly need the behavior and capabilities it provides.\
 It is always better to be specific about the types you expect to work with in your code.
 
 
 The `objects` array can now be iterated, and each object in the array can be checked to see if it conforms to the `HasArea` protocol:
 
 */
for object in objects {
    if let objectWithArea = object as? HasArea {
        print("Area is \(objectWithArea.area)")
    } else {
        print("Something that doesn't have an area")
    }
}

/*:
 - - -
 
 [Next](@next)
 */
