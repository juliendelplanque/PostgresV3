as yet unclassified
fromRow: row in: schemaMirror

	^self new
		schemaMirror: schemaMirror;
		initializeFromRow: row;
		yourself