as yet unclassified
functionPragma

	^properties pragmas 
		detect: [ :each | 
			PG3SchemaMirror acceptedPragmaSelectors includes: each keyword ]
		ifNone: nil