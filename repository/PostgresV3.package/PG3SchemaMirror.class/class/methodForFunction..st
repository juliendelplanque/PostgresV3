synchronization
methodForFunction: function

	self acceptedPragmaSelectors do: [ :keyword |
		((Pragma allNamed: keyword in: self) 
			detect: [ :each |self pragma: each matchesFunction: function ]
			ifNone: nil) ifNotNil: [ :pragma |
				^pragma method ] ].
	^nil