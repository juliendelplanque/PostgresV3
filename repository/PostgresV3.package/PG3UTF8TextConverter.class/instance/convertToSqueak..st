conversion
convertToSqueak: aByteString

	1 to: aByteString size do: [ :indexOfNonAsciiCharacter |
		(aByteString at: indexOfNonAsciiCharacter) asciiValue > 127 ifTrue: [
			^self convertToSqueak: aByteString from: indexOfNonAsciiCharacter ] ].
	^aByteString