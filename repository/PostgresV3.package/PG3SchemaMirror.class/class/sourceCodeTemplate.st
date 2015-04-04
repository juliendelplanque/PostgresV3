compiling
sourceCodeTemplate

	self == PG3SchemaMirror ifTrue: [ ^super sourceCodeTemplate ].
	^'messageSelectorAndArgumentNames

	<pg3Function: ''nameOfTheFunction''
		arguments: #(''argumentName'' ''andType'')
		returns: ''returnType''
		volatility: ''volatile''>
		
begin
	-- here comes the body
end;'
		