as yet unclassified
next

	<primitive: 65>
	[ position < readLimit ] whileFalse: [ self receiveData ].
	^buffer at: (position := position + 1)