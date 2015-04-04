as yet unclassified
initializeFromRow: row

	#(schema name body) do: [ :each | 
		self perform: each asMutator with: (row atName: each) ].
	row argumentNames ifNotNil: [ :argumentNames |
		argumentNames with: row argumentTypes do: [ :arg :typ | 
			self argument: arg type: typ ] ].
	volatility := row volatility asSymbol.
	returnType := self typeNameFor: row returnType