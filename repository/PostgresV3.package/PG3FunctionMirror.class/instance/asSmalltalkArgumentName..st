as yet unclassified
asSmalltalkArgumentName: aString

	^(String streamContents: [ :stream |
		(aString findTokens: '_') withIndexDo: [ :part :index |
			stream nextPutAll: (index = 1
				ifTrue: [ part ]
				ifFalse: [ part capitalized ] ) ] ]) asLegalSelector
			