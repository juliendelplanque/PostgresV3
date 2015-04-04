transaction helpers
releaseSavepoint: aString

	self execute: 'release ', aString asPG3SqlIdentifier