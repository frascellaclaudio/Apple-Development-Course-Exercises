import Foundation
/*:
 [Previous](@previous)
 
 # Swift Essentials
 ## 12. Exercises
 
 The following exercises cover the concepts learnt in the previous sections.
 
 - callout(Exercise 1):
 Write a function `generateRandomNumber` that takes a single `Int` parameter for a maximum value, and returns the random number as an `Int`.\
 \
 Remember the function `arc4random_uniform()` takes an `UInt32` and returns an `UInt32`.
 
 - - -
 */
func generateRandomNumber(maxValue: Int) -> Int {
    return Int(arc4random_uniform(UInt32(maxValue)))
}

print(generateRandomNumber(maxValue: 1000))

/*:
 - - -
 
 - callout(Exercise 2):
 Write a function `askTheEightBall` that takes a single `String` parameter for a question, and simply prints a random reply from the following:
 
 - Signs point to yes
 - Yes
 - Reply hazy, try again
 - Without a doubt
 - My sources say no
 - As I see it, yes
 - You may rely on it
 - Concentrate and ask again
 - Outlook not so good
 - It is decidedly so
 - Better not tell you now
 - Very doubtful
 - Yes - definitely
 - It is certain
 - Cannot predict now
 - Most likely
 - Ask again later
 - My reply is no
 - Outlook good
 - Don't count on it
 
 
 - note:
 Call your `generateRandomNumber` function within this function 😉
 
 ````
 askTheEightBall(question: "Will I win the lottery")
 
 Question: Will I win the lottery?
 The Magic 8 Ball says: Yes
 
 askTheEightBall(question: "Is time travel possible")
 
 Question: Is time travel possible?
 The Magic 8 Ball says: My sources say no
 ````
 
 - - -
 */
func askTheEightBall(question: String) {
    let possibleAnswers = ["Signs point to yes", "Yes", "Reply hazy, try again",
                           "Without a doubt", "My sources say no", "As I see it, yes",
                           "You may rely on it", "Concentrate and ask again", "Outlook not so good",
                           "It is decidedly so", "Better not tell you now", "Very doubtful",
                           "Yes - definitely", "It is certain", "Cannot predict now",
                           "Most likely", "Ask again later", "My reply is no",
                           "Outlook good", "Don't count on it"]
    let answerIndex = generateRandomNumber(maxValue: possibleAnswers.count)
    let answer = possibleAnswers[answerIndex]
    
    print("Question: \(question)")
    print("The Magic 8 Ball says: \(answer)")
}

askTheEightBall(question: "Will I win the lottery")
askTheEightBall(question: "Is time travel possible")

/*:
 - - -
 
 - callout(Exercise 3):
 Write a `generatePackOfCards` function that returns an array of tuples `(card: String, value: Int)`.\
 \
 The function should return all `52` cards.\
 \
 You can do this with loops and conditionals.\
 \
 The `card` element in the tuple should display the suit as an emoji and the face value, for example `"♥️J"`.\
 \
 The `value` element in the tuple should be the `Int` value, `A = 1 ... J, Q, K = 10`.\
 \
 Decalre a variable `deck` to store the resulting array from calling your method.
 
 - - -
 */
func generatePackOfCards()  -> [(card: String, value: Int)] {
    let suits = ["❤️", "♠️", "♦️", "♣️"]
    let faces = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
    
    var deck: [(card: String, value: Int)] = []
    var card = ""
    var value = 0
    
    var counter = 1
    for suit in suits {
        for face in faces {
            counter = counter > 10 ? 10 : counter
            card = suit + face
            value = counter
            deck.append((card: card, value: value))
            counter += 1
        }
        counter = 1
    }
    
    return deck
}

var deck = generatePackOfCards()
/*:
 - - -
 
 - callout(Exercise 4 - CHALLENGE):
 Write a `getCards` function that takes two parameters, `count` as an `Int` (for the number of cards to take from the deck), and `from deck` that takes in the `deck` you generated above.\
 \
 The function should return an optional array of the tuples within the deck being passed in.\
 \
 The deck should also be modified, so that when a card is drawn from the deck, it is no longer in the deck 😉\
 \
 If there are not enough cards in the deck to satisfy the requested `count` return `nil`.
 
 - - -
 */
func getCards(count: Int, from deck: inout [(card: String, value: Int)]) -> [(card: String, value: Int)]? {
    if count > deck.count {
        return nil
    }
    
    var chosenCards : [(card: String, value: Int)] = []
    var counter = count
    while counter != 0 {
        chosenCards.append(deck.remove(at: generateRandomNumber(maxValue: deck.count)))
        counter -= 1
    }
    return chosenCards
}

/*:
 - - -
 
 - callout(Exercise 5 - CHALLENGE):
 Write a `deal` function that returns a `Bool` to simulate a deal of BlackJack.\
 \
 The function should call your `getCards` function passing in `4` and the `deck`.\
 \
 You will need to handle the case when `getCards` returns you `nil` (Not enough cards).\
 \
 `2` cards are dealt to each a player and dealer.\
 \
 It should produce the following examples depending on the cards values:
 
 
 ````
 Dealer: ♦️Q + ♣️A = 20
 Player: ♠️4 + ♦️8 = 12
 Dealer Wins!
 ````
 
 ````
 Dealer: ♠️A + ♥️4 = 5
 Player: ♦️Q + ♠️10 = 20
 Player Wins!
 ````
 
 ````
 Game Over: Not enough cards!
 ````
 
 - - -
 */
func deal() -> Bool {
    
    if let setCards = getCards(count: 4, from: &deck) {
        let dealerScore = setCards[0].value + setCards[2].value
        print("Dealer: \(setCards[0].card) + \(setCards[2].card) = \(dealerScore)")
        
        let playerScore = setCards[1].value + setCards[3].value
        print("Player: \(setCards[1].card) + \(setCards[3].card) = \(playerScore)")
        
        if dealerScore == playerScore {
            print("Draw")
        } else {
            print((dealerScore > playerScore ? "Dealer" : "Player") + " Wins!")
        }
        return true
    } else {
        print("Game Over: Not enough cards!")
        return false
    }
    
}

/*:
 - - -
 
 - callout(Exercise 6 - RELAX):
 Un-comment the following lines to simulate rounds providing your code above is named appropriately and returning the correct type 🙂
 
 - - -
 */
func simulateGame() {
    var cardsAvailable = !deck.isEmpty
    
    while cardsAvailable {
        cardsAvailable = deal()
    }
}

simulateGame()

/*:
 - - -
 
 [Next](@next)
 */
