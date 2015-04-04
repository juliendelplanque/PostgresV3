synchronization
pragma: pragma matchesFunction: function

	| arguments |
	(pragma argumentAt: 1) = function name ifFalse: [ ^false ].
	(arguments := (pragma argumentAt: 2)) size = function arguments size ifFalse: [ ^false ].
	2 to: arguments size by: 2 do: [ :i | 
		(arguments at: i) = (function arguments at: i) ifFalse: [ ^false ] ].
	^true