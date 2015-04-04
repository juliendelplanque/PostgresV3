as yet unclassified
nextInt8

	| n |
	(n := self next) > 16r7F
		ifFalse: [ ^n ]
		ifTrue: [ ^n - 16r100 ]