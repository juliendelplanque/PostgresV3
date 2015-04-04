tests
testParseFloatLength

	#(
		('1e-16' 1e-16)
		('1.0' 1.0)
		('-1.0' -1.0)
	) do: [ :each | 
		self parse: each first with: #parseFloatLength: shouldGive: each second ]