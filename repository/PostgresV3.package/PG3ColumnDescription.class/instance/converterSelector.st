as yet unclassified
converterSelector

	formatCode = 0 ifFalse: [ 
		" not text format "
		^#next: ].
	^self class converterArray atOrLast: typeId