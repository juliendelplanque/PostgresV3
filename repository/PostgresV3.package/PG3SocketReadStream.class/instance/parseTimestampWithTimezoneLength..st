parsing
parseTimestampWithTimezoneLength: length
	^DateAndTime fromString: (self next: length) asString.