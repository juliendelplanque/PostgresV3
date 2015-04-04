protocols-startup
initializingBackendStateDescription

	(self state: #InitializingBackend)
		on: PG3BackendKeyData
		connectionDo: #registerBackendKeyData:
		goto: #InitializingBackend;
		on: PG3ReadyForQuery
		connectionDo: #readyForQuery:
		goto: #WaitingForQuery