as yet unclassified
stateGraphDescription

	self 
		authenticatingStateDescription;
		authenticatingWithMD5StateDescription;
		initializingBackendStateDescription;
		waitingForQuery;
		querying;
		gotCommandComplete;
		gotRowDescription;
		gotDataRow;
		gotEmptyQueryResponse;
		gotErrorResponseDuringSimpleQuery
	