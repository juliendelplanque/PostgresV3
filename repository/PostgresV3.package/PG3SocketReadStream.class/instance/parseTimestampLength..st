parsing
parseTimestampLength: length
	^DateAndTime fromString: (self next: length) asString.