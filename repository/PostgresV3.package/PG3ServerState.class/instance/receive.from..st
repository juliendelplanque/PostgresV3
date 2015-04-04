as yet unclassified
receive: aPG3TypedMessage from: connection

	| action |
	action := transitions at: aPG3TypedMessage class ifAbsent: [ self error ].
	(action at: 2) ifNotNil: [
		connection 
			perform: (action at: 2) 
			with: aPG3TypedMessage ].
	^action at: 1