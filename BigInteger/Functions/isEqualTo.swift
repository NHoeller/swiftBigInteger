import Foundation

extension BigInteger {

    public func isEqualTo(compareAgainst: BigInteger) -> Bool {

        // if signs are not equal we are done
        if self.sign != compareAgainst.sign { return false }
        
        // quick check for zero values
        if self.sign == 0 { return true }
        
        // check for elements count
        if self.integerAsArray.count != compareAgainst.integerAsArray.count { return false }
        
        // check each array element
        for i in 0 ..< self.integerAsArray.count {

            // check if values are equal
            if self.integerAsArray[i] != compareAgainst.integerAsArray[i] { return false } 
        
        }

        // if all tests are passed the BI's are equal
        return true

    }

}
