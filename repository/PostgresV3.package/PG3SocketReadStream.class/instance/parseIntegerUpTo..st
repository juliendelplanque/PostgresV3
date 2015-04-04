parsing
parseIntegerUpTo: separatorByte

	| byte number negative |
	(negative := (number := self next - 48) = -3) "$-"
		ifTrue: [ number := 0 ].
	[ (byte := self next) = separatorByte ] whileFalse: [
		number := number * 10 + byte - 48 ].
	negative ifTrue: [ ^number negated ].
	^number