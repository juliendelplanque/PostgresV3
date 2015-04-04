tests
testParseBooleanArray

	#(
		('{}' #())
		('{t}' #(true))
		('{f}' #(false))
		('{t,f}' #(true false))
		('{f,t}' #(false true))
		('{NULL,NULL}' #(nil nil))
		('{f,t,NULL}' #(false true nil))
		('{NULL}' #(nil))
		('{t,f,t,f,NULL,f,f}' #(true false true false nil false false))
	) do: [ :each | 
		self parse: each first with: #parseBooleanArrayLength: shouldGive: each second ]