# functions

## implemented

### isEqual
> BigInteger.isEqual() -> Bool

```swift
let varName = BigInteger("1")
varName.isEqual(BigInteger("1")) // returns true
varName.isEqual(BigInteger("2")) // returns false
```

### isSmallerThan
> BigInteger.isSmallerThan(compareAgainst: BigInteger) -> Bool

```swift
let varName = BigInteger("1")
varName.isSmallerThan(compareAgainst: BigInteger("0")) // returns false
varName.isSmallerThan(compareAgainst: BigInteger("1")) // returns false
varName.isSmallerThan(compareAgainst: BigInteger("2")) // returns true
```

### isGreaterThan
> BigInteger.isGreaterThan(compareAgainst: BigInteger) -> Bool

```swift
let varName = BigInteger("1")
varName.isGreaterThan(compareAgainst: BigInteger("0")) // returns true
varName.isGreaterThan(compareAgainst: BigInteger("1")) // returns false
varName.isGreaterThan(compareAgainst: BigInteger("2")) // returns false
```

### isPositive
> BigInteger.isPositive() -> Bool

```swift
let varName1 = BigInteger("1")
varName1.isPositive() // returns true
let varName2 = BigInteger("0")
varName2.isPositive() // returns false
let varName3 = BigInteger("1", isNegative: true)
varName3.isPositive() // returns false
```

### isNegative
> BigInteger.isNegative() -> Bool

```swift
let varName1 = BigInteger("1", isNegative: true)
varName1.isNegative() // returns true
let varName2 = BigInteger("0")
varName2.isNegative() // returns false
let varName3 = BigInteger("1")
varName3.isNegative() // returns false
```

### isZero
> BigInteger.isZero() -> Bool

```swift
let varName1 = BigInteger("1", isNegative: true)
varName1.isZero() // returns false
let varName2 = BigInteger("0")
varName2.isZero() // returns true
let varName3 = BigInteger("1")
varName3.isZero() // returns false
```


## planned

### shiftLeft
### shiftRight
### additionBy
### subtracionBy
### multiplicateBy
### divideBy
### square
### remainderFrom


