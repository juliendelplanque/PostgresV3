parsing
parseFloatLength: length
	
	| digit i negative exponent mantissa exponent2 |
	i := 1.
	exponent := 0.
	(negative := (digit := self next - 48) = -3) "$-"
		ifTrue: [ 
			digit := self next - 48.
			i := 2 ].
	digit = 30 " $N asciiValue - 48 NaN " ifTrue: [ 
		self next: 2.
		^Float nan ].
	digit = 25 " $I asciiValue - 48 [-]Infinity " ifTrue: [
		self next: 7.
		negative
			ifTrue: [ ^Float infinity negated ]
			ifFalse: [ ^Float infinity ] ].
	mantissa := digit.
	[ i = length or: [ 
		digit = -2 " $. asciiValue - 48 " or: [ 
			digit =  53 " $e asciiValue - 48 " ] ] ] whileFalse: [
		mantissa := mantissa * 10 + (digit := self next - 48).
		i := i + 1 ].
	i = length ifTrue: [ 
		negative ifTrue: [ ^mantissa negated asFloat ].
		^mantissa asFloat ].
	mantissa := mantissa - digit // 10.
	digit = -2 " $. asciiValue - 48 " ifTrue: [ 
		exponent := 0.
		[ i = length or: [ 
			digit = 53 " $e asciiValue - 48 " ] ] whileFalse: [
			mantissa := mantissa * 10 + (digit := self next - 48).
			exponent := exponent - 1.
			i := i + 1 ].
		digit = 53 ifTrue: [ 
			mantissa := mantissa - 53 // 10.
			exponent := exponent + 1 ] ].
	negative ifTrue: [ mantissa := mantissa negated ].
	mantissa := mantissa asFloat.
	i = length ifTrue: [
		^mantissa * #(0.1 0.01 0.001 0.0001 1.0e-5 1.0e-6 1.0e-7 1.0e-8 1.0e-9 1.0e-10 1.0e-11 1.0e-12 1.0e-13 1.0e-14 1.0e-15 1.0e-16 1.0e-17) at: exponent negated ].
	negative := 44 - self next. " $- asciiValue = 45 $+ asciiValue = 43 => negative = +-1 "
	i := i + 1.
	exponent2 := 0.
	[ i = length ] whileFalse: [
		exponent2 := exponent2 * 10 + (self next - 48).
		i := i + 1 ].
	exponent := exponent2 * negative + exponent.
	^mantissa * (10.0 raisedTo: exponent)