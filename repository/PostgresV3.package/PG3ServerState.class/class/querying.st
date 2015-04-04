protocols-simple query
querying

	(self state: #Querying)
		on: PG3CommandComplete
		connectionDo: #commandComplete:
		goto: #GotCommandComplete;
		on: PG3RowDescription
		connectionDo: #rowDescription:
		goto: #GotRowDescription;
		on: PG3EmptyQueryResponse
		goto: #GotEmptyQueryResponse;
		on: PG3ErrorResponse 
		connectionDo: #handleError:
		goto: #GotErrorResponseDuringSimpleQuery