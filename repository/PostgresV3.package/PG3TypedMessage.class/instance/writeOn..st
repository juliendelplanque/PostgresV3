as yet unclassified
writeOn: aStream

	self writeByte: self typeByte on: aStream.
	super writeOn: aStream