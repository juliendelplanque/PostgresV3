tests
testParseTimestampWithoutTimezone

	#(
		('2010-07-20T22:31:29.924'  '2010-07-20T22:31:29.924')		
		('2010-07-20 22:31:29.924'  '2010-07-20T22:31:29.924')		
		('2010-07-20T22:31:29'  '2010-07-20T22:31:29')		
		('2010-07-20 22:31:29'  '2010-07-20T22:31:29')
	) do: [ :each | 
		self 
			parse: each first
			with: #parseTimestampWithoutTimezoneLength:
			shouldGive: each second asDateAndTime ]