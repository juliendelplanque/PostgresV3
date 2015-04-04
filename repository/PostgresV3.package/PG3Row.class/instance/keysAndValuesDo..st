enumerating
keysAndValuesDo: aBlock

	columnNameDictionary keysAndValuesDo: [ :key :value |
		aBlock value: key value: (self at: value) ]