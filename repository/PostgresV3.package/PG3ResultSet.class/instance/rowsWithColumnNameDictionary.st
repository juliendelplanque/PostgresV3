accessing
rowsWithColumnNameDictionary
	"Pass the columnNameDictionary to all rows then return the rows."
	
	| columnNameDictionary |
	columnNameDictionary := rowDescription columnNameDictionary.
	rows do: [ :each | 
		each columnNameDictionary: columnNameDictionary ].
	^rows
