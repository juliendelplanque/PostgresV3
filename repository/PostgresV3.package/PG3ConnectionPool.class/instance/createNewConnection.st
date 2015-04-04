private
createNewConnection
	
	^PG3Connection new
		arguments: connectionArguments;
		startup;
		yourself