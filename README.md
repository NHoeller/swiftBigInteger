# swift class BigInteger

this class and its extensions will deliver a big integer of (nearly) any size.
its size is only restricted by the usable memory for the array to keep it.

## usage

the instanciation of this class is most likely done by transforming a string.
the string MUST be of swift type 'String' and MUST ONLY contain:
- digits if decimalAsString is used
- the digits 1 and 0 if binaryAsString is used
- digits and / or the characters A-F (or a-f) for hexadecimalAsString
- all types accept '_' and '.' and ',' as seperators
- empty strings "" and "0" will result in a BigInteger zero

notation in swift
> let varName = BigInteger(
> decimalAsString: String
> [, isNegative: Bool = false
> [, bitSize: BigInteger.Bitsizes = BigInteger.Bitsizes.Int32 ] ]
> )

> let varName = BigInteger(
> binaryAsString: String
> [ ... (same optionals) ]
>)    

> let varName = BigInteger(
> hexadecimalAsString: String
> [ ... (same optionals) ]
> )

```swift
let first = BigInteger(decimalAsString: "16_777_215", isNegative: false, bitSize: BigInteger.BitSizes.Int8)
// returns a BigInteger [255, 255, 255] as positive with bitSize 8 bit 

let second = BigInteger(binaryAsString: "1111_1111_1111_1111")
// returns a BigInteger [65535] as positive because the default bitSize is 32 bit and the sign is positive by default

let third = BigInteger(hexadecimalAsString: "FF", isNegative: true)
// returns a BigInteger [255] as negative because the default bitSize is 32 bit
```

## functions

for the BigInteger class a cupple of functions are available (or will be created).
for further informations take a look at the [FUNCTIONS.md](https://github.com/NHoeller/swiftBigInteger/blob/master/FUNCTIONS.md)

## features

this class will automically convert different types of BigIntegers to be compatible.
```swift
let varName1 = BigInteger(decimalAsString: "65535", bitSize: BigInteger.BitSizes.Int8)
// creates a BigInteger [255,255]
let varName2 = BigInteger(decimalAsString: "65535", bitSize: BigInteger.BitSizes.Int32)
// creates a BigInteger [65535]
varName1.isEqual(varName2) // will result true
