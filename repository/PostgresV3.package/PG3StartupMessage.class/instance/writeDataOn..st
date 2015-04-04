as yet unclassified
writeDataOn: aStream

	self writeInt32: 196608 on: aStream. "Protocol version #(0 3 0 0)"
	parameters do: [ :each |
		self 
			writeString: each key on: aStream;
			writeString: each value on: aStream ].
	self writeByte: 0 on: aStream "Packet terminator"