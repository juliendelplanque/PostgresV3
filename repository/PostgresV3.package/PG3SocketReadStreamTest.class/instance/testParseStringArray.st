tests
testParseStringArray

	#(
		('{}' #())
		('{a}' #('a'))
		('{"a"}' #('a'))
		('{"foo",bar}' #('foo' 'bar'))
		('{"fo\"o\\",bar}' #('fo"o\' 'bar'))
		('{""}' #(''))
		('{NULL}' #(nil))
		('{NULL,Null,Nil}' #(nil 'Null' 'Nil'))
		('{"NULL",NULL}' #('NULL' nil))
	) do: [ :each | 
		self parse: each first with: #parseStringArrayLength: shouldGive: each second ]