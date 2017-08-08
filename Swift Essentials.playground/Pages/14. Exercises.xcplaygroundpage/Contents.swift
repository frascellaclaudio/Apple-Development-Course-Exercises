import Foundation
/*:
 [Previous](@previous)
 
 # Swift Essentials
 ## 14. Exercises
 
 The following exercises cover the concepts learnt in the previous sections.
 
 - callout(Exercise 1):
 Declare a `Bottle` structure with a property to store the current volume in millilitres.\
 \
 Add a `takeSip` method that reduces the current volume, and returns the remaining volume.\
 \
 Create an instance of the `Bottle` type and print the following two statements:
 
 
 ````
 The bottle has 330ml of beer
 After taking a sip, there is now 300ml
 ````
 
 
 - note:
 Notice how the method requires the `mutating` keyword.\
 This is due to structures being value types, and it is modifying itself.
 
 - - -
 */
struct Bottle {
    var currentVolume: Int = 0
    
    mutating func takeSip() -> Int {
        currentVolume -= 30
        return currentVolume
    }
}

var bottle = Bottle(currentVolume: 330)
print("The botle has of \(bottle.currentVolume)ml beer")
print("After taking a sip, there is now \(bottle.takeSip())ml")

/*:
 - - -
 
 - callout(Exercise 2):
 Declare a `BankAccount` class with a property to store the balance.\
 \
 Provide an initialiser to set the balance when the instance is created.\
 \
 Create an instance with an initial balance of $100.
 
 - - -
 */
class BankAccount {
    var balance: Int
    
    init(balance: Int) {
        self.balance = balance
    }
}

let dollarMight = BankAccount(balance: 100)
print("The initial balance is $\(dollarMight.balance)")
/*:
 - - -
 
 - callout(Exercise 3):
 Declare an `ATM` structure with a type method `withdraw` that produces the following when called like so:\
 \
 ATM.withdraw(amount: 80, from: dollarMight)\
 ATM.withdraw(amount: 50, from: dollarMight)\
 \
 Where `dollarMight` is the `BankAccount` instance you created above.
 
 
 ````
 Attempting to withdraw $80.0
 Dispensing $80.0
 Balance $20.0
 Attempting to withdraw $50.0
 Insufficient funds
 Balance $20.0
 ````
 
 - - -
 */
struct ATM {
    
    static func withdraw(amount: Int, from bankAccount: BankAccount){
        
        print("Attempting to withdraw $\(amount)")
        
        if amount <= bankAccount.balance {
            print("Dispensing $\(amount)")
            bankAccount.balance -= amount
        } else {
            print("Insufficient funds")
        }
        
        print("Balance $\(bankAccount.balance)")
        
    }
}

//var myATM = ATM()
ATM.withdraw(amount: 80, from: dollarMight)
ATM.withdraw(amount: 50, from: dollarMight)
/*:
 - - -
 
 - callout(Exercise 4):
 Declare a `Song` structure with the following properties:\
 \
 `artist`, `title`, `albumn`, `year`\
 \
 Create an array of songs.\
 \
 Declare a `JukeBox` structure that stores a collection of songs, and provides a `play(track:)` method that performs the following:
 
 
 ````
 Song(artist: "The Verve", title: "Lucky Man", albumn: "Urban Hymns", year: 1997),
 Song(artist: "Sugar Ray", title: "Fly", albumn: "Floored", year: 1997),
 Song(artist: "Third Eye Blind", title: "Graduate", albumn: "Third Eye Blind", year: 1997)
 
 ...
 
 jukeBox.play(track: 2)
 
 ...
 
 Now playing: Sugar Ray - Fly [Floored - 1997]
 ````
 
 - note:
 Notice the track number!
 
 - - -
 */
struct Song {
    var artist: String
    var title: String
    var albumn: String
    var year: Int
    
    init(artist: String, title: String, albumn: String, year: Int) {
        self.artist = artist
        self.title = title
        self.albumn = albumn
        self.year = year
    }
}

struct JukeBox {
    var playList: [Song]
    
    init(playList: [Song]) {
        self.playList = playList
    }
    
    func play(track: Int) {
        if track < playList.count {
            let song = playList[track-1]
            print("Now playing: \(song.artist) - \(song.title) [\(song.albumn) - \(song.year)]")
        } else {
            print("Song not available")
        }
    }

}

let songs = [Song(artist: "The Verve", title: "Lucky Man", albumn: "Urban Hymns", year: 1997),
             Song(artist: "Sugar Ray", title: "Fly", albumn: "Floored", year: 1997),
             Song(artist: "Third Eye Blind", title: "Graduate", albumn: "Third Eye Blind", year: 1997)]

var jukeBox = JukeBox(playList: songs)
jukeBox.play(track: 2)

/*:
 - - -
 
 - callout(Exercise 5 - CHALLENGE):
 Re-do your Card/Black Jack exercise however using a `Card` type instead of the tuple.
 
 - - -
 */
struct Card {
    var card: String
    var value: Int
}

func generatePackOfCards()  -> [Card] {
    let suits = ["❤️", "♠️", "♦️", "♣️"]
    let faces = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
    
    var deck: [Card] = []
    var counter = 1
    for suit in suits {
        for face in faces {
            counter = counter > 10 ? 10 : counter
            deck.append(Card(card: suit + face, value: counter))
            counter += 1
        }
        counter = 1
    }
    
    return deck
}

var deck = generatePackOfCards()

func generateRandomNumber(maxValue: Int) -> Int {
    return Int(arc4random_uniform(UInt32(maxValue)))
}

func getCards(count: Int, from deck: inout [Card]) -> [Card]? {
    if count > deck.count {
        return nil
    }
    
    var chosenCards : [Card] = []
    var counter = count
    while counter != 0 {
        chosenCards.append(deck.remove(at: generateRandomNumber(maxValue: deck.count)))
        counter -= 1
    }
    
    return chosenCards
}

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
