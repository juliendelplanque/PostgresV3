as yet unclassified
readFrom: stream

	| converters |
	values := connection currentRowClass new: stream nextInt16.
	converters := connection currentConverterSelectors.
	1 to: values size do: [ :index |
		| valueLength |
		values at: index put: (
			(valueLength := stream nextInt32) = -1
				ifTrue: [ nil ]
				ifFalse: [ stream perform: (converters at: index) with: valueLength ]) ]
	