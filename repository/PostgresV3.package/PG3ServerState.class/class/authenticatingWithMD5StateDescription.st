protocols-startup
authenticatingWithMD5StateDescription

	(self state: #AuthenticatingWithMD5)
		on: PG3AuthenticationOkMessage goto: #InitializingBackend