parsing
parseScaledDecimalArrayLength: length

	^self parseArrayWith: [ self parseNullOr: [ self parseScaledDecimal ] ] length: length