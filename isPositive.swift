import Foundation

extension BigInteger {

    public func isPositive() -> Bool {
    
        // check sign
        if self.sign == 1 { return true }
        
        // if not negative return false
        return false
    }
}
