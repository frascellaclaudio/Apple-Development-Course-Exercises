import Foundation
/*:
 [Previous](@previous)
 
 # Swift Essentials
 ## 10. Exercises
 
 The following exercises cover the concepts learnt in the previous sections.
 
 - callout(Exercise 1):
 Write a `while` loop to iterate through the array of integers and print the highest number:
 
 
 ````
 The highest number is 96
 ````
 
 - - -
 */
let numbers = [64, 52, 23, 37, 96, 44, 76, 81]

var highestNum = numbers[0]
var index = 1
while index < numbers.count {
    if highestNum < numbers[index] {
        highestNum = numbers[index]
    }
    index += 1
}

print("The highest number is \(highestNum)")
/*:
 - - -
 
 - callout(Exercise 2):
 Re-write your solution above using a `for-in` loop.\
 \
 Remember to reset the higest number variable.
 
 - - -
 */
var maxNum = numbers[0]
for number in numbers {
    if maxNum < number {
        maxNum = number
    }
}
print("The highest number is \(maxNum)")
/*:
 - - -
 
 - callout(Exercise 3):
 Write a `for-in` loop to iterate through the array of integers and output the lowest number:
 
 
 - note:
 You  should use interval matching, and remember you can use the ternary conditional operator 😊
 
 - - -
 */
var lowestNum = numbers[0]
for index in 1..<numbers.count {
    lowestNum = lowestNum > numbers[index] ? numbers[index] : lowestNum
}
print("The lowest number is \(lowestNum)")
/*:
 - - -
 
 - callout(Exercise 4):
 `99 Bottles of Beer` is a traditional song in both the United States and Canada. It is popular to sing on long trips, as it has a very repetitive format which is easy to memorise and can take a long time to sing. In particular, the song is often sung by children on long bus trips.\
 \
 The song's lyrics are as follows:\
 \
 `99 bottles of beer on the wall, 99 bottles of beer.`\
 `Take one down, pass it around, 98 bottles of beer on the wall...`\
 \
 Write a loop to sing the entire song from `99` to none:
 
 
 ````
 99 bottles of beer on the wall, 99 bottles of beer.
 Take one down, pass it around, 98 bottles of beer on the wall...
 
 ...
 
 2 bottles of beer on the wall, 2 bottles of beer.
 Take one down, pass it around, 1 bottle of beer on the wall...
 1 bottle of beer on the wall, 1 bottle of beer.
 Take it down, pass it around, no more bottles of beer on the wall...
 No more bottles of beer on the wall, no more bottles of beer.
 Go to the store and buy some more, 99 bottles of beer on the wall...
 ````
 
 - - -
 */
var bottleCount = 99

while (bottleCount >= 0) {
    if bottleCount > 0 {
        print("\(bottleCount) bottles of beer on the wall, \(bottleCount) bottles of beer.")
        print("Take one down, pass it around, \( (bottleCount-1 == 0) ? "no more" : String(bottleCount-1)) bottles of beer on the wall...")
    } else {
        print("No more bottles of beer on the wall, no more bottles of beer.")
        print("Take one down, pass it around, no more bottles of beer on the wall...")
    }
    bottleCount -= 1
}

/*:
 - - -
 
 - callout(Exercise 5 - CHALLENGE):
 Declare two arrays one for the `stations` and another for the `times`.\
 \
 `times` should be an array of arrays:\
 \
 `["8:00", "8:03", "8:05"]`\
 `["8:15", "8:18", "8:20"]`\
 `["8:30", "8:33", "8:35"]`\
 `["8:45", "8:48", "8:50"]`\
 `["9:00", "9:03", "9:05"]`\
 \
 Write loops to produce the following output:
 
 
 ````
 Central		Town Hall		Martin Place
 8:00			8:03			8:05
 8:15			8:18			8:20
 8:30			8:33			8:35
 8:45			8:48			8:50
 ````
 
 - note:
 You can use `\t` within a `String` to add a tab (space).\
 \
 The console won't be precise with aligning tabs.\
 \
 To stop the `print()` statement automatically appending the `\n` new-line character,\
 you can use `print(<whatever>, terminator: "")`.
 
 - - -
 */
let stations = ["Central", "Town Hall", "Martin Place"]
let times = [["8:00", "8:03", "8:05"],
             ["8:15", "8:18", "8:20"],
             ["8:30", "8:33", "8:35"],
             ["8:45", "8:48", "8:50"],
             ["9:00", "9:03", "9:05"]]

var stationArray = ""

for station in stations {
    print(station, separator: "", terminator: "\t\t")
}
var timeString = "\n"
for timeGroup in times {
    for time in timeGroup {
        timeString.append(time)
        timeString.append("\t\t\t")
    }
    timeString.append("\n")
}
print(timeString)

/*:
 - - -
 
 [Next](@next)
 */
