synchronization
fetchFunctionsFromCode

	^Array streamContents: [ :stream |
		self acceptedPragmaSelectors do: [ :keyword |
			(Pragma allNamed: keyword in: self) do: [ :pragma | 
				stream nextPut: (PG3FunctionMirror fromPragma: pragma in: self) ] ] ]