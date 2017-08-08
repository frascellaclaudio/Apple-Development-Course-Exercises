import Foundation
/*:
 [Previous](@previous)
 
 # Swift Essentials
 ## 3. Exercises
 
 The following exercises cover the concepts learnt in the previous sections.
 
 - callout(Exercise 1):
 Declare constants with type annotation to store information of a mobile device, such as `modelName`, `screenSize`, `storageSize`, `onSale` and `price`:
 
 - - -
 */
let modelName: String
let screenSize: Double
let storageSize: Int
let onSale: Bool
var price: Double

/*:
 - - -
 
 - callout(Exercise 2):
 Assign values to the constants you delcared above:
 
 
 - note:
 Notice how Xcode provides code completion 😊
 
 - - -
 */
modelName = "iPhone 6"
screenSize = 5.5
storageSize = 16
onSale = true
price = 459.99
/*:
 - - -
 
 - callout(Exercise 3):
 Use the `print()` function to log the details to the console, for example:\
 \
 `Model: iPhone 6`\
 `Screen: 5.5 inch`\
 `Storage: 16 GB`\
 `On Sale: true`\
 `Price: $459.99`
 
 
 - note:
 You will need to use string interpolation. Here's an example to insert `firstName` into a `String`:\
 \
 `"Hello \(firstName), how are you?"`
 
 - - -
 */
let firstName = "Frascella"
print("Hello \(firstName), how are you?")


print("Model: " + modelName)
print("Screen: \(screenSize)")
print("Storage: \(storageSize) GB")
print("On Sale: \(onSale)")
print("Price: $\(price)")
/*:
 - - -
 
 - experiment:
 Can you change the value of `price`?
 
 - - -
 */
price = 449.99
print("Changed Price: $\(price)")
/*:
 - - -
 
 - note:
 Notice what the error message and Fix-it said:\
 \
 Immutable value 'price' may only be initialized once\
 Change 'let' to 'var' to make it mutable
 
 
 - important:
 **Immutable** means it can not be modified (*mutated*) once it has been initialised (assigned an initial value)\
 **Mutable** means it can be modified.
 
 - - -
 
 - callout(Exercise 4):
 Declare constants and assign initial values so the type can be inferred, to store information of a song, such as `artistName`, `albumnName`, `songTitle`, `trackNo`, `length` and `bitRate`:
 
 
 - note:
 `length` should be in seconds, i.e `273`\
 Some common bitrates are `128`, `192`, `256`
 
 - - -
 */
let artistName = "Coldplay"
let albumnName = "Unknown Album (2017)"
let songTitle = "A Sky Full of Stars"
let trackNo = 3
let length = 273
let bitRate = 192

/*:
 - - -
 
 - callout(Exercise 5):
 Use the `print()` function to log the details to the console, for example:\
 \
 `Now Playing: Third Eye Blind - Jumper`\
 `Track: 4 of albumn: Third Eye Blind (1997)`\
 `Details: 4m 33s @ 192kbps = 6.4MB`
 
 
 - note:
 You can calculate the file size in MB using the following:\
 \
 `fileSize = Double(length * bitRate) / (8 * 1024)`
 
 - - -
 */
let fileSize = Double(length * bitRate) / (8 * 1024)
let lengthMinute = length / 60
let lengthSeconds = length % 60

print("Now Playing: \(artistName) - \(songTitle)")
print("Track: \(trackNo) of album: \(albumnName)")
print("Details: \(lengthMinute)m \(lengthSeconds)s @ \(bitRate)kbps = \(fileSize)MB")
/*:
 - - -
 
 - callout(Exercise 6):
 MEGA Movies sells movie tickets to adults and children where the following pricing applies:\
 \
 Adults @ `$25`\
 Children @ `$12.50`\
 \
 Members recieve a `20%` discount, or the same discount is applied for order totals of `$75` or more.\
 They are registered for tax and final totals should include a `10%` rate.\
 \
 Write the code to produce the following output:\
 \
 Senario 1 - No discount:\
 \
 `MEGA Movies:`\
 \
 `2 x Adult/s | $50.0`\
 `0 x Child/s | $0.0`\
 \
 `TOTAL ex    | $50.0`\
 `TOTAL inc   | $55.0`\
 \
 Senario 2 - Discount applied:\
 \
 `MEGA Movies:`\
 \
 `2 x Adult/s | $50.0`\
 `0 x Child/s | $0.0`\
 \
 `*** Discount Applied ***`\
 \
 `TOTAL ex    | $40.0`\
 `TOTAL inc   | $44.0`
 
 
 - note:
 You will need to **cast** an `Int` to a `Double` to multiply them, example:\
 \
 `let myInt = 4`\
 `let myDouble = Double(myInt) * 0.2`
 
 - - -
 */
let member = false
let numberOfAdult = 2
let numberOfChild = 0

let priceAdult = 25.0
let priceChild = 12.5
let discount = 0.20
let taxRate = 0.10

let totalPriceAdult = priceAdult * Double(numberOfAdult)
let totalPriceChild = priceChild * Double(numberOfChild)

var totalEx = totalPriceAdult + totalPriceChild
let totalExMember = totalEx * (1 - discount)
let totalInc: Double

print("MEGA Movies:\n")
print("\(numberOfAdult) x Adult/s | $\(totalPriceAdult)")
print("\(numberOfChild) x Child/s | $\(totalPriceChild)")


if member || totalEx >= 75.0 {
    print("\n*** Discount Applied ***")
    totalEx = totalExMember
}
totalInc = totalEx + (totalEx * taxRate)

print("\nTOTAL ex  | $ \(totalEx)")
print("TOTAL inc | $ \(totalInc)")
