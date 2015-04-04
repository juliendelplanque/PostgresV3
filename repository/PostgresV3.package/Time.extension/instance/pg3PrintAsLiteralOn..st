*PostgresV3-Core
pg3PrintAsLiteralOn: stream

	stream nextPut: $'.
	self print24: true showSeconds: true on: stream.
	stream nextPut: $'