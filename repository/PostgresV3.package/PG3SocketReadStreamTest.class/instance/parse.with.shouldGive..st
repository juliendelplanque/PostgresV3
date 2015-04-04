helpers
parse: aString with: parseSelector shouldGive: anObject

	self 
		parse: aString 
		with: parseSelector
		assert: [ :parsedValue | parsedValue = anObject ]
		