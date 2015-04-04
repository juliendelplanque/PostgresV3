transaction helpers
show: aString

	^self execute: 'show ', aString asPG3SqlIdentifier