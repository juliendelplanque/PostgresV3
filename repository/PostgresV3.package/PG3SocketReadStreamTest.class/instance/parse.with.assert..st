helpers
parse: aString with: parseSelector assert: assertBlock

	| parsedValue |
	stream buffer replaceFrom: 1 to: aString size with: aString startingAt: 1.
	stream 
		readLimit: aString size;
		position: 0.
	parsedValue := stream perform: parseSelector with: aString size.
	self 
		assert: stream position = aString size;
		assert: (assertBlock value: parsedValue)
		