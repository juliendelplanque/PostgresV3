tests
testParseScaledDecimal

	#(
		('1' 1s0)
		('0' 0s0)
		('0.0' 0s1)
		('-1.00' -1s2)
		('-123456.78910' -123456.78910s5)
		('123456.78910' 123456.78910s5)
	) do: [ :each | 
		self parse: each first with: #parseScaledDecimalLength: shouldGive: each second ].
	self parse: 'NaN' with: #parseScaledDecimalLength: assert: [ :parsedValue | parsedValue isNaN ]