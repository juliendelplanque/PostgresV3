testing
isReadyForQuery

	^state
		ifNil: [ false ]
		ifNotNil: [
			state name = #WaitingForQuery ]
		