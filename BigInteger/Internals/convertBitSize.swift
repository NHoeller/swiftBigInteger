import Foundation

extension BigInteger {

    public func convertBitSize(to newBitSizePerChunk: BitSizes) {

        // if bit size is the same or only one element
        if newBitSizePerChunk.rawValue == bitSizePerChunk { return }

        // define mutable variables
        var source: [UInt32] = integerAsArray
        var result: [UInt32] = []
        let newMaxSizePerChunk: UInt64 = UInt64(pow(Double(2),Double(newBitSizePerChunk.rawValue)) - 1)

        // convert from lower bitSize to higher bitSize
        if newBitSizePerChunk.rawValue > bitSizePerChunk {

            // define some variables
            var current: UInt64 = 0
            var shift: Int = 0
 
            while let next = source.last {
                // remove current used element
                source.removeLast()

                // compute result
                current = current + (UInt64(next) << UInt64(shift))
                shift = shift + bitSizePerChunk < newBitSizePerChunk.rawValue ? shift + bitSizePerChunk : 0
                if shift == 0 {
                    result.insert(UInt32(current), atIndex: 0)
                    current = 0
                }

            }

            if current > 0 {
                result.insert(UInt32(current), atIndex: 0)
            }
            
        }

        // convert from higher bitSize to lower bitSize
        else {

            // define some variables
            var dividend: UInt64

            while let next = source.last {
                // remove current used element
                source.removeLast()
                // compute result
                dividend = UInt64(next)
                for _ in (0..<Int(bitSizePerChunk / newBitSizePerChunk.rawValue)) {
                    result.insert(UInt32(dividend % (newMaxSizePerChunk + 1)), atIndex: 0)
                    dividend = dividend / (newMaxSizePerChunk + 1)
                }
            }

            // remove trailing "0" elements
            while result.first! == 0 {
                result.removeFirst()
            }
            
        }

        // store converted values to BigInteger
        bitSizePerChunk = newBitSizePerChunk.rawValue
        maxSizePerChunk = newMaxSizePerChunk
        integerAsArray = result

    }

}
