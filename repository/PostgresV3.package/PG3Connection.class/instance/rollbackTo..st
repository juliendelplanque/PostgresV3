transaction helpers
rollbackTo: aString

	self execute: 'rollback to ', aString asPG3SqlIdentifier