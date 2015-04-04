as yet unclassified
printSynthetizedMethodPatterOn: stream

	| nameParts firstRealArgumentIndex |
	nameParts := (name findTokens: '_').
	stream nextPutAll: nameParts first asLegalSelector.
	nameParts allButFirstDo: [ :each | 
		stream nextPutAll: each asLegalSelector capitalized ].
	firstRealArgumentIndex := (arguments size > 0 and: [ arguments second = 'refcursor' ])
		ifTrue: [ 3 ]
		ifFalse: [ 1 ].
	firstRealArgumentIndex to: arguments size by: 2 do: [ :index |
		| argumentName |
		argumentName := self asSmalltalkArgumentName: (arguments at: index).
		index = firstRealArgumentIndex 
			ifFalse: [ stream space; nextPutAll: argumentName ].
		stream nextPutAll: ': '; nextPutAll: argumentName ]