as yet unclassified
downloadAll

	changes do: [ :each | 
		each isLocalOnly ifFalse: [ 
			each saveIntoSchemaMirror ] ].
	self refresh