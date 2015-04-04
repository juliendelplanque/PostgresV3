*PostgresV3-Core
asPG3SqlIdentifier

	^String streamContents: [ :stream |
		stream nextPut: $".
		self do: [ :each |
			(#($" $\) includes: each) ifTrue: [
				stream nextPut: each ].
			stream nextPut: each ].
		stream nextPut: $" ]