parsing
parseScaledDecimalArrayLength: length
	| endIndex |
	"Dont look at this. Heart attack would follow."
	endIndex := offset + position + length - 1.
	^ Array
		streamContents: [ :stream | 
			self next.	"skip ${"
			[ offset + position < endIndex ]
				whileTrue: [ 
					| oldPosition currentScaledDecimalLength next |
					oldPosition := position.
					[ 
					next := self next.
					next = $, asciiValue or: [ offset + position = endIndex ] ] whileFalse.
					currentScaledDecimalLength := position - oldPosition.
					next = $, asciiValue
						ifTrue: [ currentScaledDecimalLength := currentScaledDecimalLength - 1 ].	"-1 because we ate the $,"
					position := oldPosition.
					stream nextPut: (self parseNullOr: [ self parseScaledDecimalLength: currentScaledDecimalLength ]).
					self next	" skip $, and $} " ].
			offset + position = endIndex
				ifTrue: [ self next ]	"skip optional $}" ]