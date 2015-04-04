as yet unclassified
writeOn: aStream
	"Leave place for the length, write the message, then fill the length."

	| lengthPosition endPosition |
	lengthPosition := aStream position.
	aStream skip: 4.
	self writeDataOn: aStream.
	endPosition := aStream position.
	aStream position: lengthPosition.
	self writeInt32: endPosition - lengthPosition on: aStream.
	aStream position: endPosition
	