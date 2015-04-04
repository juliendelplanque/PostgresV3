protocols-simple query
gotEmptyQueryResponse

	(self state: #GotEmptyQueryResponse)
		on: PG3ReadyForQuery
		connectionDo: #readyForQuery:
		goto: #WaitingForQuery;
		on: PG3ErrorResponse 
		connectionDo: #handleError:
		goto: #GotErrorResponseDuringSimpleQuery