as yet unclassified
withArgumentArrayFor: functionPragma

	^encoder tempNodes size = 1 and: [ 
		| size |
		size := functionPragma arguments second size.
		functionPragma arguments second second = 'refcursor' ifTrue: [ 
			" Refcursors as the first argument do not count into the arguments size "
			size := size - 2 ].
		size > 2 ]