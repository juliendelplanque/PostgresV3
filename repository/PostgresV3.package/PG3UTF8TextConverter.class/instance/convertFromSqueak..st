conversion
convertFromSqueak: aString

	1 to: aString size do: [ :indexOfNonAsciiCharacter |
		(aString at: indexOfNonAsciiCharacter) asciiValue > 127 ifTrue: [
			^self convertFromSqueak: aString from: indexOfNonAsciiCharacter ] ].
	^aString