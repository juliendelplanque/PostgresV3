parsing
parseScaledDecimalLength: length

	| byte i numerator negative dotPosition |
	(negative := (numerator := self next - 48) = -3) "$-"
		ifTrue: [ numerator := 0 ].
	numerator = 30 " $N asciiValue - 48 NaN " ifTrue: [ 
		self next: 2.
		^Float nan ].
	i := 1.
	[ i = length ] whileFalse: [
		(byte := self next) = 46 " $. asciiValue " ifTrue: [	
			i := i + 1.
			dotPosition := i.
			byte := self next. ].
		numerator := numerator * 10 + byte - 48.
		i := i + 1 ].
	negative ifTrue: [ numerator := numerator negated ].
	dotPosition ifNil: [ ^numerator asScaledDecimal: 0 ].
	^ScaledDecimal 
		newFromNumber: (Fraction
			numerator: numerator
			denominator: (10 raisedTo: length - dotPosition)) 
		scale: length - dotPosition
	