conversion
convertToSqueak: aByteString from: indexOfNonAsciiCharacter
	
	| index resultStream buffer |
	buffer := (String new: aByteString size - 1)
		replaceFrom: 1 to: indexOfNonAsciiCharacter - 1 with: aByteString startingAt: 1;
		yourself.
	resultStream := (WriteStream on: buffer)
		setFrom: indexOfNonAsciiCharacter to: buffer size;
		yourself.
	index := indexOfNonAsciiCharacter.
	[ index <= aByteString size ] whileTrue: [ 
		| byte1 |
		(byte1 := aByteString basicAt: index) < 128
			ifTrue: [ resultStream nextPut: (aByteString at: index) ]
			ifFalse: [
				| byte2 |
				byte2 := aByteString basicAt: (index := index + 1).
				byte1 < 224
					ifTrue: [ resultStream nextPut: (
						Character value: ((byte1 bitAnd: 31) bitShift: 6) + (byte2 bitAnd: 63)) ]
					ifFalse: [
						| byte3 |
						byte3 := aByteString basicAt: (index := index + 1).
						byte1 < 240
							ifTrue: [ resultStream nextPut: (
								Character value: ((byte1 bitAnd: 15) bitShift: 12) + 
									((byte2 bitAnd: 63) bitShift: 6) + (byte3 bitAnd: 63)) ]
							ifFalse: [
								| byte4 |
								byte4 := aByteString basicAt: (index := index + 1).
								resultStream nextPut: (
									Character value: ((byte1 bitAnd: 16r7) bitShift: 18) +
										((byte2 bitAnd: 63) bitShift: 12) + 
										((byte3 bitAnd: 63) bitShift: 6) +
										(byte4 bitAnd: 63)) ] ] ].
		index := index + 1 ].
	resultStream position = aByteString size
		ifTrue: [ ^resultStream originalContents ].
	^resultStream contents