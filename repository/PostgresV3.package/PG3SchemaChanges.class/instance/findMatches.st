as yet unclassified
findMatches

	| localFunctions remoteFunctions allFunctions |
	localFunctions := schemaMirror fetchFunctionsFromCode.
	remoteFunctions := schemaMirror fetchFunctionsFromDatabase.
	allFunctions := OrderedCollection new.
	allFunctions addAll: (localFunctions collect: [ :each | each -> #local ]).
	allFunctions addAll: (remoteFunctions collect: [ :each | each -> #remote ]).
	allFunctions sort: [ :a :b | 
		| result |
		result := a key compare: b key.
		result = 1 or: [ 
			result = 2 and: [ 
				a value <= b value ] ] ].
	^Array streamContents: [ :stream |
		| index change |
		index := 2.
		[ index <= allFunctions size ] whileTrue: [
			| currentFunction previousFunction |
			previousFunction := (allFunctions at: index - 1) key.
			currentFunction := (allFunctions at: index) key.
			(previousFunction name = currentFunction name and: [
				previousFunction arguments size = currentFunction arguments size and: [ 
					(2 to: currentFunction arguments size by: 2) allSatisfy: [ :each |
						(currentFunction arguments at: each) = (previousFunction arguments at: each) ] ] ])
				ifFalse: [
					change := PG3Change new.
					(allFunctions at: index - 1) value == #local
						ifTrue: [ change localFunction: previousFunction ]
						ifFalse: [ change remoteFunction: previousFunction ].
					index := index + 1 ]
				ifTrue: [ 
					change := PG3Change new
						localFunction: previousFunction;
						remoteFunction: currentFunction;
						yourself.
					index := index + 2 ].
			stream nextPut: change ].
		index = (allFunctions size + 1) ifTrue: [
			change := PG3Change new.
					(allFunctions at: index - 1) value == #local
						ifTrue: [ change localFunction: (allFunctions at: index - 1) key ]
						ifFalse: [ change remoteFunction: (allFunctions at: index - 1) key ].
			stream nextPut: change ] ]