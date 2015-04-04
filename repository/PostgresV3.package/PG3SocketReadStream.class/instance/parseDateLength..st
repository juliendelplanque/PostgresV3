parsing
parseDateLength: length

	| year month day |
	year := self parseIntegerUpTo: 45 "$- asciiValue".
	month := self parseIntegerLength: 2.
	self next.
	day := self parseIntegerLength: 2.
	year < 0 ifTrue: [ "parse ' BC'"
		self next: 3 ].
	^Date 
		starting: (self newDateAndTimeYear: year month: month day: day)	
		duration: (Duration seconds: 86400)
	