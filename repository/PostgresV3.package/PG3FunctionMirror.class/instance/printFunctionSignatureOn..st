as yet unclassified
printFunctionSignatureOn: stream

	stream
		nextPutAll: self name;
		nextPut: $(.
	2 to: arguments size by: 2 do: [ :index | 
		index = 2 ifFalse: [ stream nextPutAll: ', ' ].
		stream 
			nextPutAll: (arguments at: index) ].
	stream nextPut: $)