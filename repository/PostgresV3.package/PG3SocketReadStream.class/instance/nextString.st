as yet unclassified
nextString

	^String streamContents: [ :stream |
		| next |
		[ (next := self next) ~= 0 ] whileTrue: [ 
			stream nextPut: (Character value: next) ] ]