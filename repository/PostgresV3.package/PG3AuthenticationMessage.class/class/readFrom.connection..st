as yet unclassified
readFrom: stream connection: connection

	| length |
	length := stream nextInt32 - 4.
	^(AuthenticationDispatcher at: stream nextInt32 + 1) new
		connection: connection;
		length: length;
		readFrom: stream;
		yourself