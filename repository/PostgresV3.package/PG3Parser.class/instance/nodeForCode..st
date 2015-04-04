as yet unclassified
nodeForCode: aString

	^MessageNode new
		receiver: (encoder encodeVariable: 'self')
		selector: #flag:
		arguments: { encoder encodeLiteral: aString }
		precedence: 3
		from: encoder