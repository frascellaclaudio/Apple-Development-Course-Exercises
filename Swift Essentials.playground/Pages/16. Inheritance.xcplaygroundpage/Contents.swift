import Foundation
/*:
 [Previous](@previous)
 
 # Swift Essentials
 ## 15. Inheritance
 
 ### Inheritance
 
 A class can inherit methods and properties from another class. When one class inherits from another, the inheriting class is known as a *subclass*, and the class it inherits from is known as its *superclass*.
 
 Classes in Swift can call and access methods and properties belonging to their superclass and can provide their own overriding versions of those methods and properties to refine or modify their behavior.
 
 - - -
 
 ### Defining a Base Class
 
 Any class that does not inherit from another class is known as a *base class*.
 
 The example below defines a base class called `Person`:
 
 */
class Person {
    var title: String
    var firstName: String
    var surname: String
    
    init(title: String, firstName: String, surname: String) {
        self.title = title
        self.firstName = firstName
        self.surname = surname
    }
    
    var fullName: String {
        return "\(title) \(firstName) \(surname)"
    }
}

/*:
 - note:
 The `fullName` property above is known as a *read-only computed property*.\
 \
 A read-only computed property always returns a value, and can be accessed through dot syntax, but cannot be set to a different value.
 
 
 You create a new instance of `Person` with initialiser syntax, and with that new `Person` instance, you can access its `fullName` property to print the persons full name:
 */
let mary = Person(title: "Ms", firstName: "Mary", surname: "Poppins")

print("Person: \(mary.fullName)")

/*:
 - - -
 
 ### Subclassing
 
 *Subclassing* is the act of basing a new class on an existing class. The subclass **inherits** characteristics from the existing class, which you can then refine.
 You can also add new characteristics to the subclass.
 
 To indicate that a subclass has a superclass, write the subclass name before the superclass name, separated by a colon (`:`).
 
 - note:
 A class can only inherit from one superclass.
 
 The following example defines a subclass called `Employee`, with a superclass of `Person`:
 
 */
class Employee: Person {
    var payRate = 0.0
    
    func calculatePay(for hours: Double) -> Double {
        return payRate * hours
    }
}

let erlich = Employee(title: "Ms", firstName: "Erlich", surname: "Bachman")

/*:
 The new `Employee` instance above is also a `Person`.
 However an `Employee` adds a `payRate` property and a `calculatePay` method.
 
 You can modify the inherited properties - `title`, `firstName` or `surname` of an `Employee` instance, and query the instance’s inherited `fullName` property:
 
 */
erlich.title = "Mr"
erlich.payRate = 60

print("Employee: \(erlich.fullName)")

/*:
 - - -
 
 ### Overriding
 
 A subclass can provide its own custom implementation of an instance method, type method, instance property or type property that it would otherwise inherit from a superclass. This is known as *overriding*.
 
 To override a characteristic that would otherwise be inherited, you prefix your overriding definition with the `override` keyword.
 
 
 ### Overriding Methods
 
 You can override an inherited instance or type method to provide a tailored or alternative implementation of the method within your subclass.
 
 The following example defines a new subclass of `Employee` called `Manager`, which overrides the `calculatePay()` method inherited from `Employee`:
 
 */
class Manager: Employee {
    var bonus = 0.0
    
    override func calculatePay(for hours: Double) -> Double {
        return (payRate * hours) + bonus
    }
}

/*:
 If we create a new instance of `Manager` and call its `calculatePay()` method, you can see that the `Manager` subclass version of the method is called:
 
 */
let clarke = Manager(title: "Ms", firstName: "Clarke", surname: "Griffin")

clarke.payRate = 60
clarke.bonus = 100

print("Employee Pay: \(erlich.calculatePay(for: 30))")
print("Manager  Pay: \(clarke.calculatePay(for: 30))")

/*:
 - - -
 
 ### Overriding Properties
 
 You can override an inherited instance or type property to provide your own custom getter and setter for that property.
 
 The following example defines a new class called `Director`, which is a subclass of `Manager`. The `Director` class overrides the `fullName` property it inherits from `Person`, to provide a custom description:
 
 */
class Director: Manager {
    override var fullName: String {
        return "Director - \(title) \(firstName) \(surname)"
    }
}

let steve = Director(title: "Mr", firstName: "Steve", surname: "Jobs")

print("Person: \(steve.fullName)")

/*:
 - - -
 
 ### Accessing Superclass Methods and Properties
 
 When you provide a method or property override for a subclass, it is sometimes useful to use the existing superclass implementation as part of your override.
 
 Where this is appropriate, you access the superclass version of a method or property by using the `super` prefix:
 
 - An overridden method named `someMethod()` can call the superclass version of `someMethod()` by calling `super.someMethod()` within the overriding method implementation.
 - An overridden property called `someProperty` can access the superclass version of `someProperty` as `super.someProperty` within the overriding implementation.
 
 Let's look at an example:
 
 */
// This is our base class
class Vehicle {
    var currentSpeed = 0
    
    var description: String {
        return "traveling at \(currentSpeed)km/h"
    }
    
    func accelerate() {
        currentSpeed += 10
        print(description)
    }
}

// Here is a Car subclass
class Car: Vehicle {
    var gear = 0
    
    override var description: String {
        return super.description + " in gear \(gear)"
    }
    
    override func accelerate() {
        currentSpeed += 10
        super.accelerate()
    }
}

let genericVehicle = Vehicle()
genericVehicle.accelerate()

let ferrari = Car()
ferrari.gear = 2
ferrari.accelerate()

/*:
 - - -
 
 ### Initialiser Inheritance and Overriding
 
 Subclasses do not inherit their superclass initialisers by default. However, superclass initialisers are automatically inherited if certain conditions are met. In practice, this means that you do not need to write initialiser overrides in many common scenarios, and can inherit your superclass initialisers with minimal effort.
 
 If your subclass doesn’t define any initialisers, it automatically inherits all of its superclass initialisers.
 
 You may have noticed this from the `Person` example above.
 
 The `RecipeIngredient` class introduces a `quantity` property (in addition to the `name` property it inherits from `Food`) and defines an initialiser for creating `RecipeIngredient` instances:
 
 */
class Food {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

class RecipeIngredient: Food {
    var quantity: Int
    
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
}

let eggs = RecipeIngredient(name: "Eggs", quantity: 6)

let milk: Food = RecipeIngredient(name: "Milk", quantity: 2)

let someGuy: Person = Director(title: "Mr", firstName: "John", surname: "Smith")

func printFullName(_ p: Person) {
    print(p.fullName)
}

printFullName(someGuy)
printFullName(clarke)
printFullName(erlich)
printFullName(steve)

/*:
 The `RecipeIngredient` class has a single initialiser, `init(name: String, quantity: Int)`, which can be used to populate all of the properties of a new `RecipeIngredient` instance.
 
 This initialiser starts by assigning the passed `quantity` argument to the `quantity` property, which is the only new property introduced by `RecipeIngredient`.
 
 After doing so, the initialiser delegates up to the `init(name: String)` initialiser of the `Food` class.
 
 - - -
 
 [Next](@next)
 */
