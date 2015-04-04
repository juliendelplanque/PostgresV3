as yet unclassified
readFrom: stream connection: connection

	^self new
		connection: connection;
		length: stream nextInt32 - 4;
		readFrom: stream;
		yourself