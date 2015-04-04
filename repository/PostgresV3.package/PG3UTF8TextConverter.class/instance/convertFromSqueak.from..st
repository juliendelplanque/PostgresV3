conversion
convertFromSqueak: aString from: indexOfNonAsciiCharacter
	
	| resultStream buffer |
	buffer := (ByteString new: aString size + 1)
		replaceFrom: 1 to: indexOfNonAsciiCharacter - 1with: aString startingAt: 1;
		yourself.
	resultStream := (WriteStream on: buffer)
		setFrom: indexOfNonAsciiCharacter to: buffer size;
		yourself.
	indexOfNonAsciiCharacter to: aString size do: [ :index |
		| character byteCount mask shift |
		(character := aString at: index) asciiValue < 128
			ifTrue: [ resultStream nextPut: character ]
			ifFalse: [ 
				| characterCode |
				characterCode := character charCode.
				byteCount := characterCode highBit + 3 // 5.
				mask := #(128 192 224 240) at: byteCount.
				shift := 1 - byteCount * 6.
				resultStream nextPut: (Character value: (characterCode bitShift: shift) + mask).
				2 to: byteCount do: [ :byteIndex |
					resultStream nextPut: (
						Character value: (
							(characterCode bitShift: (shift := shift + 6)) bitAnd: 63) + 128) ] ] ].
	resultStream position = aString size
		ifTrue: [ ^resultStream originalContents ].
	^resultStream contents