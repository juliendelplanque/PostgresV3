query building
createRefcursorQuery: functionName signature: signature withArguments: arguments

	signature size - 2 / 2 = arguments size ifFalse: [ 
		self error: 'Unexpected number of arguments.' ].
	^String streamContents: [ :stream |
		| argumentStream first |
		stream
			nextPutAll: 'select ';
			nextPutAll: self schema;
			nextPut: $.;
			nextPutAll: functionName;
			nextPutAll: '('.
		argumentStream := arguments readStream.
		first := true.
		signature pairsDo: [ :name :type |
			first 
				ifTrue: [ first := false ]
				ifFalse: [ stream nextPutAll: ', ' ].
			type = 'refcursor'
				ifTrue: [ 
					self cursorName pg3PrintAsLiteralOn: stream.
					stream nextPutAll: '::refcursor' ]
				ifFalse: [
					argumentStream next pg3PrintAsLiteralOn: stream.
					stream
						nextPutAll: '::';
						nextPutAll: type ] ].
		stream
			nextPutAll: ');fetch all from ';
			nextPutAll: self cursorName asPG3SqlIdentifier;
			nextPutAll: ';close ';
			nextPutAll: self cursorName asPG3SqlIdentifier ]