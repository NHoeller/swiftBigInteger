import Foundation

extension BigInteger {

    public func isNegative() -> Bool {
    
        // check sign
        if self.sign == -1 { return true }
        
        // if not negative return false
        return false

    }

}
