accessing
printOn: aStream

	super printOn: aStream.
	aStream
		nextPut: $(;
		nextPutAll: name;
		nextPutAll: ', ';
		print: typeId;
		nextPut: $)