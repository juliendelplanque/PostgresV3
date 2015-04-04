parsing
parseStringArrayLength: length

	^self parseArrayWith: [ self parseStringInArray ] length: length