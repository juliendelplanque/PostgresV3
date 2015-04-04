parsing
parseStringLength: length

	| byteString bytesAvailable |
	byteString := ByteString basicNew: length.
	length < 14 ifTrue: [ 
		1 to: length do: [ :i |
			byteString basicAt: i put: self next ].
		^textConverter convertToSqueak: byteString ].
	(bytesAvailable := readLimit - position) >= length ifTrue: [ 
		byteString replaceFrom: 1 to: length with: buffer startingAt: position + 1.
		position := position + length.
		^textConverter convertToSqueak: byteString ].
	byteString replaceFrom: 1 to: bytesAvailable with: buffer startingAt: position + 1.
	readLimit := position.
	[ bytesAvailable < length ] whileTrue: [
		bytesAvailable := bytesAvailable + (
			socket 
				waitForData;
				receiveSomeDataInto: byteString startingAt: bytesAvailable + 1) ].
	^textConverter convertToSqueak: byteString
		