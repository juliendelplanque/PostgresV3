tests
testParseBoolean

	self 
		parse: 't' with: #parseBooleanLength: shouldGive: true;
		parse: 'f' with: #parseBooleanLength: shouldGive: false