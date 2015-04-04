tests
testParseFloatArray

	#(
		('{}' #())
		('{1.23}' #(1.23))
		('{-1.23}' #(-1.23))
		('{-1.0,1.0}' #(-1.0 1.0))
		('{NULL}' #(nil))
	) do: [ :each | 
		self parse: each first with: #parseFloatArrayLength: shouldGive: each second ]