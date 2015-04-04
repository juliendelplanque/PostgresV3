parsing
parseFloatArrayLength: length
	| endIndex |
	"Dont look at this. Heart attack would follow."
	
			endIndex := offset + position + length - 1.
			^Array
				streamContents: [ :stream | 
					self next.	"skip ${"
					[ offset + position < endIndex ]
						whileTrue: [ 
							| oldPosition currentFloatlength next |
							oldPosition := position.
							[ 
							next := self next.
							next = $, asciiValue or: [ offset + position = endIndex ] ] whileFalse.
							currentFloatlength := position - oldPosition.
							next = $, asciiValue
								ifTrue: [ currentFloatlength := currentFloatlength - 1 ].	"-1 because we ate the $,"
							position := oldPosition.
							stream nextPut: (self parseNullOr: [self parseFloatLength: currentFloatlength]).
							self next	" skip $, and $} " ].
					offset + position = endIndex
						ifTrue: [ self next ]	"skip optional $}" ].