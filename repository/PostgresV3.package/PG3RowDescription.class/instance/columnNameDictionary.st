as yet unclassified
columnNameDictionary

	| dictionary |
	dictionary := IdentityDictionary new: columnDescriptions size * 2.
	columnDescriptions doWithIndex: [ :columnDescription :index |
		dictionary at: columnDescription name asSymbol put: index ].
	^dictionary