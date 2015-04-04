parsing
parseTimestampWithoutTimezoneLength: length
	"Postgres supports several date/time formats. This method parses a subset of ISO/XSD dates used by Postgres. This means the following format: -?\d{4}-\d{2}\d{2}[ T]\d{2}:\d{2}:\d{2}(.\d+)?"

	^self
		newDateAndTimeYear: (self parseIntegerUpTo: 45 "$- asciiValue")
		month: (self parseIntegerUpTo: 45 "$- asciiValue")
		day: (self parseIntegerLength: 2)
		seconds:
			(self next; parseIntegerUpTo: 58 "$: asciiValue") * 60 + "hours"
			(self parseIntegerUpTo: 58 "$: asciiValue") * 60 + "minutes"
			(self parseIntegerLength: 2) "seconds"
		nanoSeconds: (length > 19 "has milli/microsecond part"
			ifFalse: [ 0 ]
			ifTrue: [
				(self next; parseIntegerLength: length - 20) *
				(10 raisedToInteger: 29 - length) ])
		offset: Duration zero