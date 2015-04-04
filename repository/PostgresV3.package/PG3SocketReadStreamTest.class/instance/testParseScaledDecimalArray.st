tests
testParseScaledDecimalArray

	#(
		('{}' #())
		('{0}' #(0s0))
		('{0.0,-1.00,-123456.78910,123456.78910,NULL}' #(0s1 -1s2 -123456.78910s5 123456.78910s5 nil))
	) do: [ :each | 
		self parse: each first with: #parseScaledDecimalArrayLength: shouldGive: each second ]