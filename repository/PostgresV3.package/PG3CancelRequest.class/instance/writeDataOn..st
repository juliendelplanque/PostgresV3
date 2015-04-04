as yet unclassified
writeDataOn: aStream

	self 
		writeInt32: 80877102 on: aStream; "1234 5678"
		writeInt32: processId on: aStream;
		writeInt32: secretKey on: aStream
	