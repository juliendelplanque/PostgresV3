protocols-simple query
gotErrorResponseDuringSimpleQuery

	(self state: #GotErrorResponseDuringSimpleQuery)
		on: PG3ReadyForQuery
		connectionDo: #readyForQuery:
		goto: #WaitingForQuery