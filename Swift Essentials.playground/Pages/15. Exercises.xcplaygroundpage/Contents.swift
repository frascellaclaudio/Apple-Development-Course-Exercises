import Foundation
/*:
 [Previous](@previous)
 
 # Swift Essentials
 ## 15. Exercises
 
 - callout(Exercise 1):
 You are required to model a simple solution for a local Motor Vehicle Service business.\
 The system is only interested in modelling these entities: `Car`, `CarOwner`, `RepairJob`.\
 \
 You are required to:

 - Apply your knowledge to create a class definition for each of these entities: Car, CarOwner, RepairJob
 - Include three or four properties which will best describe each object created from each class definition
 - Initialize objects of each class and populate them with test data.  Use the expect output below as a guide
 
 Car owner details:	 Kiew Chan 	92173738
 
 Car Details: 	 YIS831, Toyota
 
 Labour cost is $ 60/hour; Time spent repairing car: 5 hours
 
 Total cost: $750.0, Part cost: $450.0
 
 Car owner details:	Grahame	0419722577
 
 Car Details: 	 CNY230, Volvo
 
 Labour cost is $80/ hour; Time spent repairing car: 4 hours
 
 Total cost: $870.0, Part cost: $550.0
 
 Car owner details:	Julian		95344646, 0414182281
 
 Car Details: 	 Ford
 
 Labour cost is $50/hour; Time spent repairing car: 4 hours
 
 Total cost: $450.0, Part cost: $250.0
 
 
 */
class Car {
    var plateNumber: String
    var model: String
    
    init(plateNumber: String, model: String) {
        self.plateNumber = plateNumber
        self.model = model
    }
    
    convenience init(model: String) {
        let plateNumber = ""
        self.init(plateNumber: plateNumber, model: model)
    }
}

class CarOwner {
    var name: String
    var homePhoneNumber: String
    var mobileNumber: String
    
    init(name: String, homePhoneNumber: String, mobileNumber: String) {
        self.name = name
        self.homePhoneNumber = homePhoneNumber
        self.mobileNumber = mobileNumber
    }
    
    convenience init(name: String, homePhoneNumber: String) {
        let mobileNumber = ""
        self.init(name: name, homePhoneNumber: homePhoneNumber, mobileNumber: mobileNumber)
    }
    
    convenience init(name: String, mobileNumber: String) {
        let homePhoneNumber = ""
        self.init(name: name, homePhoneNumber: homePhoneNumber, mobileNumber: mobileNumber)
    }
    
}

class RepairJob {
    var laborCost: Double
    var timeSpent: Int
    var partCost: Double
    
    init(laborCost: Double, timeSpent: Int, partCost: Double) {
        self.laborCost = laborCost
        self.timeSpent = timeSpent
        self.partCost = partCost
    }
    
    var totalCost: Double {
        return self.partCost + (self.laborCost * Double(self.timeSpent))
    }
}

struct Customer {
    var carOwner: CarOwner
    var carDetails: Car
    var repairJob: RepairJob
}

func printServiceDetails(customer: Customer) {
    print("Car Owner Details: \(customer.carOwner.name)\t\(customer.carOwner.homePhoneNumber)\t\(customer.carOwner.mobileNumber)")
    print("Car Details: \(customer.carDetails.plateNumber)\t\(customer.carDetails.model)")
    print("Labour cost is $ \(customer.repairJob.laborCost)/hour; Time spent repairing car: \(customer.repairJob.timeSpent) hours")
    print("Total cost: $\(customer.repairJob.totalCost), Part cost: $\(customer.repairJob.partCost)\n")
    
}

let customerOne = Customer(carOwner: CarOwner(name: "Kiew Chan", homePhoneNumber: "92173738"),
                       carDetails: Car(plateNumber: "YIS831", model: "Toyota"),
                       repairJob: RepairJob(laborCost: 60.0, timeSpent: 5, partCost: 450.0))

let customerTwo = Customer(carOwner: CarOwner(name: "Grahame", mobileNumber: "0419722577"),
                           carDetails: Car(plateNumber: "CNY230", model: "Volvo"),
                           repairJob: RepairJob(laborCost: 80.0, timeSpent: 4, partCost: 550.0))
    
let customerThree = Customer(carOwner: CarOwner(name: "Julian", homePhoneNumber: "95344646", mobileNumber: "0414182281"),
                             carDetails: Car(model: "Ford"),
                             repairJob: RepairJob(laborCost: 50.0, timeSpent: 4, partCost: 250.0))

printServiceDetails(customer: customerOne)
printServiceDetails(customer: customerTwo)
printServiceDetails(customer: customerThree)
/*:
 - - -
 
 [Next](@next)
 */
