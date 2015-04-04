as yet unclassified
writeString: aByteString on: aStream

	1 to: aByteString size do: [ :index |
		aStream nextPut: (aByteString at: index) asciiValue ].
	aStream nextPut: 0
	