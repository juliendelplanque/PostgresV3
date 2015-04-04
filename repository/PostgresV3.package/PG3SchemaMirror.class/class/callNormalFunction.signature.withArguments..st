query execution
callNormalFunction: functionName signature: signature withArguments: arguments

	| result rs query |
	query := self createNormalQuery: functionName signature: signature withArguments: arguments.
	rs := self executeQuery: query.
	(rs last class = PG3ErrorResponse) ifTrue: [ 
		Error signal: rs last message ].
	result := rs last rows at: 1 ifAbsent: nil.
	result ifNotNil: [ result := result at: 1 ].
	^result