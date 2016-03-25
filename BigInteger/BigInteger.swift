import Foundation

public class BigInteger {

    // define error codes
    enum BIerror: ErrorType {
        case wrongCharacter
    }

    // define constants and variables
    var integerAsArray: [UInt32]!
    let bitSizePerChunk: Int
    let maxSizePerChunk: UInt64
    var sign: Int
    var sourceType: (base: Int, allowed: allowedChars)
    
    // init method
    public init(string: String, negative: Bool = false, bitSize: BitSizes = BitSizes.Bits32) {

        // create manipulative string
        var stringToConvert: String = string

        // set bitSizePerChunk, and maxSizePerChunk
        bitSizePerChunk = bitSize.rawValue
        maxSizePerChunk = UInt64(pow(Double(2), Double(bitSizePerChunk)) - 1)

        // if string is empty or zero
        if stringToConvert == "" || stringToConvert == "0" {

            // define zero value
            sign = 0
            sourceType = (base: 0, allowed: allowedChars.zero)
            integerAsArray = [0]

        } else {

            // get stringType if defined
            let stringType = stringToConvert.characters.count > 2 ? stringToConvert.substringToIndex(stringToConvert.startIndex.advancedBy(2)) : ""

            // convert String depending on stringType
            switch stringType {

                // binary source type e.g. 0b11111111
                case "0b":
                    sourceType = (base: 2, allowed: allowedChars.binary)
                    stringToConvert = stringToConvert.substringFromIndex(stringToConvert.startIndex.advancedBy(2))

                // octal source type e.g. 0o72342
                case "0o":
                    sourceType = (base: 8, allowed: allowedChars.octal)
                    stringToConvert = stringToConvert.substringFromIndex(stringToConvert.startIndex.advancedBy(2))

                // hexadecimal source type e.g. 0x e6f2a8
                case "0x":
                    sourceType = (base: 16, allowed: allowedChars.hexadecimal)
                    stringToConvert = stringToConvert.substringFromIndex(stringToConvert.startIndex.advancedBy(2))

                // decimal source type (prefixed) e.g. 0d147345
                case "0d":
                    sourceType = (base: 10, allowed: allowedChars.decimal)
                    stringToConvert = stringToConvert.substringFromIndex(stringToConvert.startIndex.advancedBy(2))
                // or decimal non prefixed e.g 147345
                default:
                    sourceType = (base: 10, allowed: allowedChars.decimal)
            }

            // set sign for the BigInteger
            sign = Int(negative ? -1 : 1)
            
            do {
                
                integerAsArray = try convertString(stringToConvert, sourceType: sourceType)

            } catch BIerror.wrongCharacter {

                print("ERROR: BigInteger")
                print("CODE: wrong character")
                print("")
                print("DESCRIPTION: the string contains not allowed characters")
                print("  for the input type : '\(sourceType.allowed)'")
                print("  allowed characters are : '\(sourceType.allowed.rawValue)'")
                print("")

                integerAsArray = [0]
                sign = 0

            } catch {
                
            }
        }
        
    }

    public func convertString(stringToConvert: String, sourceType: (base: Int, allowed: allowedChars)) throws -> [UInt32] {

        // define variables
        var currentString: String = stringToConvert.lowercaseString
        var result: [UInt32] = []
        let base: UInt64 = UInt64(sourceType.base)
        let allowed: String = sourceType.allowed.rawValue
        
        while currentString != "" {

            // define variables for current loop
            var dividend: UInt64 = 0
            var remainder: UInt64 = 0
            var newString: String = ""

            // loop all cahracters in currentString
            for char in currentString.characters {

                if let digit = allowed.characters.indexOf(char) {

                    // calculate the remainder and dividend 
                    dividend = dividend * base + UInt64(String(digit))!
                    remainder = dividend / (maxSizePerChunk + 1)
                    dividend = dividend % (maxSizePerChunk + 1)
                    // combine newString with remainder for next run
                    newString = (newString == "" && remainder == 0) ? "" : newString + String(remainder, radix: Int(base))

                } else {

                    // if we have invalid characters
                    throw BIerror.wrongCharacter

                }

            }

            // insert the dividend to result
            result.insert(UInt32(dividend), atIndex: 0)
            currentString = newString

        }

        // done here
        return result

    }

}
