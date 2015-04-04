as yet unclassified
initializeConverterArray

	| textConverterSelectors |
	textConverterSelectors := self textConverterSelectors.
	converterArray := Array 
		new: (textConverterSelectors detectMax: [ :each | each first ]) first + 1 " make sure that the last element is the default element (#next:), because we will access the elements with #atOrLast:"
		withAll: #next:.
	textConverterSelectors do: [ :each |
		converterArray at: each first put: each second ]
	 
