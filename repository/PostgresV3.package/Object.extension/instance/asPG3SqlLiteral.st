*PostgresV3-Core
asPG3SqlLiteral

	^String streamContents: [ :stream |
		self pg3PrintAsLiteralOn: stream ]