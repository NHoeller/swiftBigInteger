import Foundation

extension BigInteger {

    public func isSmallerThan(compareAgainst: BigInteger) -> Bool {
    
        // check sign first
        if self.sign < compareAgainst.sign { return true }
        
        // check element count next
        if self.integerAsArray.count < compareAgainst.integerAsArray.count { return true }
    
        // so both arrays are the same size
        // loop all array elements
        for i in 0 ..< self.integerAsArray.count {
        
            // if element is smaller comparison is completed
            if self.intgerAsArray[i] < compareAgainst.integerAsArray[i] { return true }
            
            // if element is greater comparison is also completed
            if self.intgerAsArray[i] > compareAgainst.integerAsArray[i] { return false }
            
        }
        
        // arrays are equal
        return false
    }
}
