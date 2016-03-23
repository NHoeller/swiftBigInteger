import Foundation

extension BigInteger {

    public func greaterThan(compareAgainst: BigInteger) -> Bool {

        // test for sign
        if self.sign > compareAgainst.sign { return true }
        
        // test element count
        if self.integerAsArray.count > compareAgainst.integerAsArray.count { return true }
        
        // so both arrays are the same size
        // loop all array elements
        for i in 0 ..< self.integerAsArray.count {
        
            // if element is greater comparison is completed
            if self.intgerAsArray[i] > compareAgainst.integerAsArray[i] { return true }
            
            // if element is smaller comparison is also completed
            if self.intgerAsArray[i] < compareAgainst.integerAsArray[i] { return false }
            
        }
        
        // arrays are equal
        return false
    }

}
