import Foundation

public enum BitSizes: Int {

    case Bits4 = 4
    case Bits8 = 8
    case Bits16 = 16
    case Bits32 = 32

}

public enum allowedChars: String {
    
    case zero = ""
    case binary = "01"
    case octal = "01234567"
    case decimal = "0123456789"
    case hexadecimal = "0123456789abcdef"

}
