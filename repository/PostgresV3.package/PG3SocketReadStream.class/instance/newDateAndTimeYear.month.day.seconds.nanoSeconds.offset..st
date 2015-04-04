object creation
newDateAndTimeYear: year month: month day: day seconds: seconds nanoSeconds: nanoSeconds offset: offset

	| p q r s |
	p := month - 14 quo: 12.
	q := year + 4800 + p.
	r := month - 2 - (12 * p).
	s := (year + 4900 + p) quo: 100.
	^DateAndTime basicNew
		setJdn: (1461 * q quo: 4) + (367 * r quo: 12) - (3 * s quo: 4) + day - 32075
		seconds: seconds
		nano: nanoSeconds
		offset: offset;
		yourself
	