import Foundation

extension BigInteger {

    public func isPositive() -> Bool {
    
        // check sign
        if self.sign == 1 { return true }
        
        // if not positive return false
        return false

    }

}
