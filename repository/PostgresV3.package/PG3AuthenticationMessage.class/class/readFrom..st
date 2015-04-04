as yet unclassified
readFrom: stream

	| length |
	length := stream nextInt32 - 4.
	^(AuthenticationDispatcher at: stream nextInt32 + 1) new
		length: length;
		readFrom: stream;
		yourself