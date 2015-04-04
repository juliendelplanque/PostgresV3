as yet unclassified
printOn: stream

	(localFunction ifNil: [ remoteFunction ]) printFunctionSignatureOn: stream.
	localFunction 
		ifNil: [ stream nextPutAll: ' (remote only)' ]
		ifNotNil: [ 
			remoteFunction 
				ifNil: [ stream nextPutAll: ' (local only)' ]
				ifNotNil: [ 
					self hasSameSource ifFalse: [
						stream nextPutAll: ' (changed)' ] ] ]