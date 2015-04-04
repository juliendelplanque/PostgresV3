transaction helpers
savepoint: aString

	self execute: 'savepoint ', aString asPG3SqlIdentifier