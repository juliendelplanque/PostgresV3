parsing
parseArrayWith: aBlock length: length

	| endIndex |
	endIndex := offset + position + length - 1.
	^Array streamContents: [ :stream |
		self next. "skip ${"
		[ offset + position < endIndex ] whileTrue: [ 
			stream nextPut: aBlock value.
			self next. " skip $, and $} " ].
		offset + position = endIndex ifTrue: [ self next ] "skip optional $}" ]