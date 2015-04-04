as yet unclassified
testColumnNameMapping

	| columnNameDictionary row |
	columnNameDictionary := IdentityDictionary new
		at: #foo put: 1;
		at: #bar put: 2;
		at: #baz put: 3;
		yourself.
	row := PG3Row for: columnNameDictionary.
	self assert: row size = 3.
	row atName: #foo put: 'foo'.
	row atName: #bar put: 'bar'.
	row atName: #baz put: 'baz'.
	self assert: row columnNameDictionary == columnNameDictionary.
	self assert: row foo = 'foo'.
	self assert: row bar = 'bar'.
	self assert: row baz = 'baz'.
	self assert: (row at: 1) = 'foo'.
	self assert: (row at: 2) = 'bar'.
	self assert: (row at: 3) = 'baz'.
	self assert: (row at: 1) == row foo.
	self assert: (row at: 2) == row bar.
	self assert: (row at: 3) == row baz.
	self shouldnt: [ row name ] raise: Error.
	self assert: row name isString