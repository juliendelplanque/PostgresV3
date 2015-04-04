parsing
parseJsonLength: length

	| result |
	result := self parseStringLength: length.
	(Smalltalk classNamed: 'Json') ifNotNil: [ :json |
		^json readFrom: result readStream ].
	^result