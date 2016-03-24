import Foundation

public class BigInteger {
    
    public enum BitSizes: Int {
        case Int4 = 4
        case Int8 = 8
        case Int16 = 16
        case Int32 = 32
    }
    
    // define sign for BI (negative: -1 , zero: 0 , positive: 1)
    let sign: Int
    
    // define bitSize taken from enum:BitSizes
    let bitSizePerChunk: Int
    
    // defines maximum size per chunk
    // e.g. bitSizePerChunk = 4 -> maxSizePerChunk = 15 (binary 1111)
    // e.g. bitSizePerChunk = 8 -> maxSizePerChunk = 255 (binary 1111 1111)
    let maxSizePerChunk: UInt64
    
    // define the BigInteger
    let integerAsArray: [UInt32]
    
    public init(decimalAsString: String, isNegative: Bool = false, bitSize: BigInteger.BitSizes = BigInteger.BitSizes.Int32) {

        if decimalAsString == "" {

            integerAsArray = [0]
            sign = 0

        } else {

            integerAsArray = []
            // todo - transform string to array
            sign = isNegative ? -1 : 1

        }

        bitSizePerChunk = bitSize.rawValue
        maxSizePerChunk = UInt64(pow(Double(2), Double(bitSizePerChunk)) - 1)

    }

}
