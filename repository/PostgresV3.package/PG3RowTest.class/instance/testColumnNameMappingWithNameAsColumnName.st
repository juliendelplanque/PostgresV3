as yet unclassified
testColumnNameMappingWithNameAsColumnName

	| columnNameDictionary row |
	columnNameDictionary := IdentityDictionary new
		at: #foo put: 1;
		at: #bar put: 2;
		at: #baz put: 3;
		at: #name put: 4;
		yourself.
	row := PG3Row for: columnNameDictionary.
	self assert: row size = 4.
	self assert: row name isNil.
	row atName: #name put: 'name'.
	self assert: row name = 'name'.
	self assert: (row at: 4) = 'name'.
	self assert: (row at: 4) == row name