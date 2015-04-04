protocols-simple query
gotCommandComplete

	(self state: #GotCommandComplete)
		on: PG3CommandComplete
		connectionDo: #commandComplete:
		goto: #GotCommandComplete;
		on: PG3ReadyForQuery
		connectionDo: #readyForQuery:
		goto: #WaitingForQuery;
		on: PG3RowDescription
		connectionDo: #rowDescription:
		goto: #GotRowDescription;
		on: PG3ErrorResponse 
		connectionDo: #handleError:
		goto: #GotErrorResponseDuringSimpleQuery