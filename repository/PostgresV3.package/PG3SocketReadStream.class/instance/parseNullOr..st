parsing
parseNullOr: aBlock

	self next = 78 "$N asciiValue"
		ifTrue: [
			(self next = 85 and: [
				self next = 76 and: [
					self next = 76 ] ])
			ifTrue: [ ^nil ]
			ifFalse: [ self error: 'Couldn''t parse null!' ] ]
		ifFalse: [
			position := position - 1.
			^aBlock value ]
	
		