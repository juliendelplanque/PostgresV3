as yet unclassified
uploadAll

	changes do: [ :each | 
		each isRemoteOnly ifFalse: [ 
			each saveToDatabase ] ].
	self refresh