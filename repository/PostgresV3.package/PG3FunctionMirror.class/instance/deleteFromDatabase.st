as yet unclassified
deleteFromDatabase

	schemaMirror executeQuery: (
		String streamContents: [ :stream |
			stream 
				nextPutAll: 'drop function ';
				nextPutAll: schemaMirror schema;
				nextPut: $..
			self printFunctionSignatureOn: stream ])