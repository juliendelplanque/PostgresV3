as yet unclassified
nextInt16

	| n |
	(n := self next * 256 + self next) > 16r7FFF
		ifFalse: [ ^n ]
		ifTrue: [ ^n - 16r10000 ]