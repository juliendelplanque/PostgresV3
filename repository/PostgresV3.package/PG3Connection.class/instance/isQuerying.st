testing
isQuerying

	^state
		ifNil: [ false ]
		ifNotNil: [
			state name = #Querying ]
		