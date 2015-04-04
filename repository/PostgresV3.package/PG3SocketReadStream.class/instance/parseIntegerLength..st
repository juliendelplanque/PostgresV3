parsing
parseIntegerLength: length

	| number negative |
	(negative := (number := self next - 48) = -3) "$-"
		ifTrue: [ number := 0 ].
	2 to: length do: [ :index |
		number := number * 10 + (self next - 48) ].
	negative ifTrue: [ ^number negated ].
	^number