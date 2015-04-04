parsing
parseIntegerArrayLength: length

	^self parseArrayWith: [ self parseNullOr: [ self parseInteger ] ] length: length