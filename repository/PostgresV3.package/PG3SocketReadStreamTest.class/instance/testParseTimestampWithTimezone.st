tests
testParseTimestampWithTimezone

	#(
		('2010-07-20T22:31:29.924+02'  '2010-07-20T22:31:29.924+02:00')
		('2010-07-20T22:31:29+02'      '2010-07-20T22:31:29+02:00')		
	) do: [ :each | 
		self 
			parse: each first
			with: #parseTimestampWithTimezoneLength:
			shouldGive: each second asDateAndTime ]