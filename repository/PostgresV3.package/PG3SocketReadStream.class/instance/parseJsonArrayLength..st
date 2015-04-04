parsing
parseJsonArrayLength: length

	| result |
	result  := self parseStringArrayLength: length.
	(Smalltalk classNamed: 'Json') ifNotNil: [ :json |
		result replace: [ :each | json readFrom: each readStream ] ].
	^result