tests
testParseInteger

	#(1 0 -1 2 -2 1073741823 -1073741824 10737418231073741823 -10737418231073741823)  do: [ :each |
		self parse: each asString with: #parseIntegerLength: shouldGive: each ]