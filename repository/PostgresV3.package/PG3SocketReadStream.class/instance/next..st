as yet unclassified
next: count

	| byteArray bytesAvailable |
	byteArray := ByteArray basicNew: count.
	count < 14 ifTrue: [ 
		1 to: count do: [ :i |
			byteArray at: i put: self next ].
		^byteArray ].
	(bytesAvailable := readLimit - position) >= count ifTrue: [ 
		byteArray replaceFrom: 1 to: count with: buffer startingAt: position + 1.
		position := position + count.
		^byteArray ].
	byteArray replaceFrom: 1 to: bytesAvailable with: buffer startingAt: position + 1.
	readLimit := position.
	[ bytesAvailable < count ] whileTrue: [
		bytesAvailable := bytesAvailable + (
			socket 
				waitForData;
				receiveSomeDataInto: byteArray startingAt: bytesAvailable + 1) ].
	^byteArray