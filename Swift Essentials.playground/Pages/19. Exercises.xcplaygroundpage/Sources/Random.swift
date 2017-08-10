import Foundation

public class Random {
    public static var decision: Bool {
        let value = arc4random_uniform(2)
        if value == 0 {
            return false
        }
        return true
    }
    
    public static var roll: Int {
        return Int(arc4random_uniform(6) + 1)
    }
}
