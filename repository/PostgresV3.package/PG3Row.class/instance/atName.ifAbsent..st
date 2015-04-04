accessing
atName: aSymbol ifAbsent: aBlock

	^self at: (columnNameDictionary 
		at: aSymbol
		ifAbsent: [ ^aBlock value ])