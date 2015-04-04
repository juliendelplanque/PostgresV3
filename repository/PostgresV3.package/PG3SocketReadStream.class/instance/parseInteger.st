parsing
parseInteger

	| digit number negative |
	(negative := (number := self next - 48) = -3) "$-"
		ifTrue: [ number := 0 ].
	[ (digit := self next - 48) >= 0 and: [ digit <= 9 ] ] whileTrue: [
		number := number * 10 + digit ].
	position := position - 1. "Leave the separator on the stream."
	negative ifTrue: [ ^number negated ].
	^number