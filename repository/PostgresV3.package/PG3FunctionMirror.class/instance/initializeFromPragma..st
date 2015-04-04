as yet unclassified
initializeFromPragma: pragma

	schema := schemaMirror schema.
	name := pragma argumentAt: 1.
	arguments := pragma argumentAt: 2.
	returnType := pragma argumentAt: 3.
	volatility := (pragma argumentAt: 4) asSymbol.
	pragma method ifNotNil: [
		self body: (pragma method literalAt: 2) ]