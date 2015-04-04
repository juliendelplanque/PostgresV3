as yet unclassified
printPragmaOn: stream

	stream nextPut: $<.
	stream 
		nextPutAll: 'pg3Function: ' ;
		print: name;
		cr; tab; tab;
		nextPutAll: 'arguments: ';
		print: arguments asArray;
		cr; tab; tab;
		nextPutAll: 'returns: ';
		print: returnType;
		cr; tab; tab;
		nextPutAll: 'volatility: ';
		print: volatility asString;
		nextPut: $>;
		cr