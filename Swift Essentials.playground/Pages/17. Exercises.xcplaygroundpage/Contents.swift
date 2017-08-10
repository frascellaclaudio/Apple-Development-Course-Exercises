import Foundation
/*:
 [Previous](@previous)
 
 # Swift Essentials
 ## 16. Exercises
 
 The following exercise covers the concepts learnt in the previous sections.
 
 - callout(Exercise 1):
 Using the provided `BankAccount` class, declare two subclasses `SavingsAccount` and `CreditAccount`.\
 \
 The `CreditAccount` should store it's balance as a negative.
 \
 The subclasses should also define an `interestRate` property where the following rates apply:\
 `SavingsAccount = 9%`\
 `CreditAccount = 11%`\
 \
 Look at the commented code below, to see how methods are called, and implement the code to achieve the following output:
 
 
 ````
 New account initialised with a balance of $1000.0
 Attempting withdrawal of $300.0
 Withdrawal successful
 Current balance $700.0
 Attempting withdrawal of $200.0
 Withdrawal successful
 Current balance $500.0
 Deposited $100.0 | Current balance $600.0
 Awarded interest of $54.0 | Current balance $654.0
 
 --------------------------------------------------
 
 New account initialised with a balance of $0.0
 Credit limit $1000.0
 Attempting withdrawal of $300.0
 Withdrawal successful
 Current balance $-300.0
 Attempting withdrawal of $200.0
 Withdrawal successful
 Current balance $-500.0
 Attempting deposit of $100.0
 Deposit successful
 Current balance $-400.0
 Charged interest of $-44.0 | Current balance $-444.0
 Attempting deposit of $444.0
 Deposit successful
 Current balance $0.0
 ````
 
 
 - note:
 Handle the situation where attempting to over deposit the credit account produces the following:
 
 
 ````
 Attempting deposit of $1444.0
 Can not over deposit
 Current balance $-444.0
 ````
 
 - - -
 */
class BankAccount {
    var balance: Double
    
    init(initialBalance bal: Double) {
        balance = bal
        print("New account initialised with a balance of $\(bal)")
    }
    
    func withdraw(amount: Double) -> Double {
        print("Attempting withdrawal of $\(amount)")
        if balance >= amount {
            balance -= amount
            print("Withdrawal successful")
        } else {
            print("Insufficient funds")
        }
        print("Current balance $\(balance)")
        return balance
    }
    
    func deposit(amount: Double) -> Double {
        balance += amount
        print("Deposited $\(amount) | Current balance $\(balance)")
        return balance
    }
}


class SavingsAccount: BankAccount {
    private var interestRate = 0.09
    
    func awardInterest() {
        let awardedInterest = balance * interestRate
        balance += awardedInterest
        print("Awarded interest of $\(awardedInterest) \t| Current balance $\(balance)")
    }
    
}

class CreditAccount: BankAccount {
    private var interestRate = 0.11
    var creditLimit: Double
    
    init(creditLimit: Double) {
        self.creditLimit = creditLimit
        super.init(initialBalance: 0)
        print("Credit limit $\(creditLimit)")
    }
    
    override func withdraw(amount: Double) -> Double {
        print("Attempting withdrawal of $\(amount)")
        if creditLimit >= amount {
            balance -= amount
            print("Withdrawal successful")
        } else {
            print("Insufficient funds")
        }
        print("Current balance $\(balance)")
        return balance
    }
    
    
    override func deposit(amount: Double) -> Double {
        print("Attempting deposit of $\(amount)")
        balance += amount
        print("Deposit successful")
        print("Current balance $\(balance)")
        return balance
    }
    
    func chargeInterest() {
        let chargedInterest = balance * interestRate
        balance += chargedInterest
        print("Charged interest of $\(chargedInterest) \t| Current balance $\(balance)")
    }
}

let mightySaver = SavingsAccount(initialBalance: 1000)
mightySaver.withdraw(amount: 1300)
mightySaver.withdraw(amount: 200)
mightySaver.deposit(amount: 100)
mightySaver.awardInterest()
mightySaver.balance

print("\n--------------------------------------------------\n")

let spendAlot = CreditAccount(creditLimit: 1000)
spendAlot.withdraw(amount: 300)
spendAlot.withdraw(amount: 200)
spendAlot.deposit(amount: 100)
spendAlot.chargeInterest()
spendAlot.balance
spendAlot.deposit(amount: 1444)

/*:
 - - -
 
 [Next](@next)
 */
