parsing
parseBooleanArrayLength: length

	^self parseArrayWith: [ self parseNullOr: [ self parseBoolean ] ] length: length