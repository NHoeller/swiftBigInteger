# swiftBigInteger

## swift class BigInteger
this class and its extensions will deliver a big integer of (nearly) any size.
its size is only restricted by the usable memory for the array to keep it.

## Usage

let varName = BigInteger(
    decimalAsString: String, 
    [ isNegative: Bool = false ],
    [ bitSize: BigInteger.Bitsizes = BigInteger.Bitsizes.Int32 ]
)

let varName = BigInteger(
    binaryAsString: String
    ... (same optionals)
)    

let varName = BigInteger(
    hexadecimalAsString: String
)

```swift
let first = BigInteger(decimalAsString: "16_777_215", isNegative: false, bitSize: BigInteger.BitSizes.Int8)
// returns a BigInteger [255, 255, 255] as positive with bitSize 8 bit 

let second = BigInteger(binaryAsString: "1111_1111_1111_1111")
// returns a BigInteger [65535] as positive because the default bitSize is 32 bit and the sign is positive by default

let third = BigInteger(hexadecimalAsString: "FF", isNegative: true)
// returns a BigInteger [255] as negative because the default bitSize is 32 bit
```
