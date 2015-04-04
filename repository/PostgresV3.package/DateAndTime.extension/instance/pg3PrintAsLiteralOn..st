*PostgresV3-Core
pg3PrintAsLiteralOn: stream

	stream
		nextPutAll: 'timestamp ''';
		print: self;
		nextPut: $'