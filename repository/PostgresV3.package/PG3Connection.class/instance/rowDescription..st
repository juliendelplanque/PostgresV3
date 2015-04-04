simple-query-protocol
rowDescription: aPG3RowDescription 

	resultSets add: (PG3ResultSet new
		rowDescription: aPG3RowDescription;
		rows: OrderedCollection new;
		yourself).
	currentConverterSelectors := aPG3RowDescription converterSelectors