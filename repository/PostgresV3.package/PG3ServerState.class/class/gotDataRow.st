protocols-simple query
gotDataRow

	(self state: #GotDataRow)
		on: PG3DataRow
		connectionDo: #dataRow:
		goto: #GotDataRow;
		on: PG3CommandComplete
		connectionDo: #commandComplete:
		goto: #GotCommandComplete;
		on: PG3ErrorResponse 
		connectionDo: #handleError:
		goto: #GotErrorResponseDuringSimpleQuery