parsing
parseStringInArray

	| string |
	self next = 34 ifTrue: [ ^self parseEscapedStringInArray ].
	position := position - 1.
	string := String streamContents: [ :stream |
		| byte |
		[ (byte := self next) 	= 44 or: [ byte = 125 ] ] whileFalse: [
			stream nextPut: (Character value: byte) ] ].
	position := position - 1.
	string = 'NULL' ifTrue: [ ^nil ].
	^textConverter convertToSqueak: string