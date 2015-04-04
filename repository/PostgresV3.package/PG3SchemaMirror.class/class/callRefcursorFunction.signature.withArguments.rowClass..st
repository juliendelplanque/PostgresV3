query execution
callRefcursorFunction: functionName signature: signature withArguments: arguments rowClass: aClass

	| rows rs query |
	query := self createRefcursorQuery: functionName signature: signature withArguments: arguments.
	
	rs := self executeQuery: query rowClass: aClass.
	(rs last class = PG3ErrorResponse) ifTrue: [ 
		Error signal: rs last message ].
	rows := (rs at: 2) rowsWithColumnNameDictionary.
	^rows