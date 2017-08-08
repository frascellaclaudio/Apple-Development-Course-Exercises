/*:
 [Previous](@previous)
 
 # Swift Essentials
 ## 7. Collections
 
 Swift provides *collection types*, such as arrays and dictionaries, for storing collections of values.
 
 - Arrays are ordered collections of values.
 - Dictionaries are unordered collections of **key-value** associations.
 
 ![IMAGE Collection Types](collections.png)
 
 Arrays and dictionaries in Swift are always clear about the types of values and keys that they can store. This means you cannot insert a value of the wrong type into a collection by mistake. It also means you can be confident about the type of values you will retrieve from a collection.
 
 - - -
 
 ### Arrays
 
 An *array* stores values of the same type in an ordered list. The same value can appear in an array multiple times at different positions.
 
 ### Creating an Empty Array
 
 You can create an empty array of a certain type using initialiser syntax:
 
 */
var someInts = [Int]()

print("The variable someInts is of type [Int] and has \(someInts.count) items.")

/*:
 - note:
 Arrays have a `count` property that returns an `Int` of the number of items in the array.
 
 */
someInts.append(7)  // someInts now has 1 item, an Int at position 0

someInts = []   // someInts is now empty, but is still of type [Int]

/*:
 - - -
 
 ### Creating an Array with a Default Value
 
 Swift’s Array type also provides an initialiser for creating an array of a certain size with all of its values set to the same default value:
 
 */
var sixDoubles = Array(repeating: 29.99, count: 6)  // sixDoubles is of type [Double]

/*:
 - - -
 
 ### Creating an Array with an Array Literal
 
 You can also initialise an array with an *array literal*, which is a shorthand way to write one or more values as an array collection.
 
 An array literal is written as a list of values, separated by commas, surrounded by a pair of square brackets:
 
 */
var shoppingList = ["Pizza", "Coke", "Garlic Bread"]    // shoppingList is of type [String]

/*:
 - - -
 
 ### Array Properties `count` and `isEmpty`
 
 To find out the number of items in an array, check its `count` property:
 
 */
shoppingList.count

/*:
 Use the Boolean `isEmpty` property as a shortcut for checking whether the `count` property is equal to `0`:
 
 */
if shoppingList.isEmpty {
    print("The shopping list is empty.")
} else {
    print("The shopping list contains \(shoppingList.count) items.")
}

/*:
 - - -
 
 ### Adding Items
 
 You can add a new item to the end of an array by calling the array’s `append(_:)` method:
 
 */
shoppingList.append("Ice Cream")

/*:
 Alternatively, append an array of one or more compatible items with the addition assignment operator (`+=`):
 
 */
shoppingList += ["Chicken Wings", "Ranch Sauce"]

/*:
 - - -
 
 ### Retrieving a Value
 
 Retrieve a value from the array by using *subscript syntax*, passing the index of the value you want to retrieve within square brackets immediately after the name of the array:
 
 */
let firstItem = shoppingList[0]

/*:
 - important:
 The first item in the array has an index of `0`, not `1`. Arrays in Swift are always zero-indexed.
 
 
 - - -
 
 ### Changing and Inserting Values
 
 You can use subscript syntax to change an existing value at a given index:
 
 */
shoppingList[1] = "Fanta"

shoppingList

/*:
 You can also use subscript syntax to change a range of values at once, even if the replacement set of values has a different length than the range you are replacing.
 
 The following example replaces `"Ice Cream"`, `"Chicken Wings"`, and `"Ranch Sauce"` with `"Lava Cake"` and `"Nuggets"`:
 
 */
shoppingList[3...5] = ["Lava Cake", "Nuggets"]

shoppingList

/*:
 To insert an item into the array at a specified index, call the array’s `insert(_:at:)` method:
 
 */
shoppingList.insert("Garlic Bread", at: 0)

shoppingList

/*:
 - - -
 
 ### Removing a Value
 
 Similarly, you remove an item from the array with the `remove(at:)` method. This method removes the item at the specified index and returns the removed item (although you can ignore the returned value if you do not need it):
 
 */
var removedItem = shoppingList.remove(at: 3)

shoppingList

/*:
 - note:
 Notice the index numbers re-order to close the gap when an item is removed.
 
 
 If you want to remove the final item from an array, use the `removeLast()` method:
 
 */
removedItem = shoppingList.removeLast()

shoppingList

/*:
 - - -
 
 ### Dictionaries
 
 A *dictionary* stores associations between keys of the same type and values of the same type in a collection with no defined ordering.
 
 Each value is associated with a unique *key*, which acts as an identifier for that value within the dictionary.
 
 Unlike items in an array, items in a dictionary do not have a specified order.
 
 You use a dictionary when you need to look up values based on their identifier, in much the same way that a real-world dictionary is used to look up the definition for a particular word.
 
 - - -
 
 ### Creating an Empty Dictionary
 
 As with arrays, you can create an empty `Dictionary` of a certain type by using initialiser syntax:
 
 */
var namesOfIntegers = [Int: String]()

print("The variable namesOfIntegers is of type [Int: String] and has \(namesOfIntegers.count) items.")

/*:
 - note:
 Dictionaries also have a `count` property that returns an `Int` of the number of key-value pairs in the dictionary.
 
 */
namesOfIntegers[7] = "seven"    // namesOfIntegers now contains 1 key-value pair

namesOfIntegers

namesOfIntegers = [:]   // namesOfIntegers is now empty, but is still of type [Int: String]

/*:
 - - -
 
 ### Creating a Dictionary with a Dictionary Literal
 
 You can also initialise a dictionary with a *dictionary literal*, which has a similar syntax to the array literal.
 
 A dictionary literal is a shorthand way to write one or more key-value pairs as a `Dictionary` collection.
 
 A *key-value* pair is a combination of a key and a value. Each key-value pair are separated by a colon. The key-value pairs are written as a list, separated by commas, surrounded by a pair of square brackets:
 
 */
var airports = ["MEL": "Melbourne", "SYD": "Sydney"]    // airports is of type [String: String]

/*:
 - - -
 
 ### Dictionary Properties `count` and `isEmpty`
 
 As with an array, you find out the number of items in a Dictionary by checking its `count` property:
 
 */
airports.count

/*:
 Use the Boolean `isEmpty` property as a shortcut for checking whether the `count` property is equal to `0`:
 
 */
if airports.isEmpty {
    print("The airports dictionary is empty.")
} else {
    print("The airports dictionary contains \(airports.count) items.")
}

/*:
 - - -
 
 ### Adding Items
 
 You can add a new item to a dictionary with subscript syntax. Use a new key of the appropriate type as the subscript index, and assign a new value of the appropriate type:
 
 */
airports["QLD"] = "Queensland"  // the airports dictionary now contains 3 items

airports

/*:
 - - -
 
 ### Changing a Value
 
 You can also use subscript syntax to change the value associated with a particular key:
 
*/
airports["MEL"] = "Melbourne Tullamarine"   // the value for "MEL" has been changed to "Melbourne Tullamarine"

airports

/*:
 As an alternative to subscripting, use a dictionary’s `updateValue(_:forKey:)` method to set or update the value for a particular key.
 
 Like the subscript example above, the `updateValue(_:forKey:)` method sets a value for a key if none exists, or updates the value if that key already exists.
 
 Unlike a subscript, however, the `updateValue(_:forKey:)` method returns the old value after performing an update. This enables you to check whether or not an update took place.
 
 The `updateValue(_:forKey:)` method returns an **optional** value of the dictionary’s value type.
 
 For a dictionary that stores `String` values, for example, the method returns a value of type `String?`, or `“optional String”`.
 
 This optional value contains the old value for that key if one existed before the update, or nil if no value existed:
 
 */
if let oldValue = airports.updateValue("Sydney International", forKey: "SYD") {
    print("The old value for SYD was \(oldValue).")
}

airports.updateValue("Perth International", forKey: "PER")

/*:
 - - -
 
 ### Retrieving a Value
 
 You can also use subscript syntax to retrieve a value from the dictionary for a particular key.
 
 Because it is possible to request a key that may not exist, a dictionary’s subscript returns an optional value of the dictionary’s value type:
 
 */
let optionalAirportName = airports["SYD"]   // Note the return type

if let airportName = airports["SYD"] {
    print("The name of the airport is \(airportName).")
} else {
    print("That airport is not in the airports dictionary.")
}

/*:
 - - -
 
 ### Removing a Key-Value Pair
 
 You can use subscript syntax to remove a key-value pair from a dictionary by assigning a value of `nil` for that key:
 
 */
airports["QLD"] = nil

airports

/*:
 Alternatively, remove a key-value pair from a dictionary with the `removeValue(forKey:)` method. This method removes the key-value pair if it exists and returns the removed value, or returns `nil` if no value existed:
 
 */
if let removedValue = airports.removeValue(forKey: "QLD") {
    print("The removed airport's name is \(removedValue).")
} else {
    print("The airports dictionary does not contain a value for QLD.")
}

/*:
 - - -
 
 [Next](@next)
 */
