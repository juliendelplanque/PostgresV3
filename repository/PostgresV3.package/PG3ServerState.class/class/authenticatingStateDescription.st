protocols-startup
authenticatingStateDescription

	(self state: #Authenticating)
		on: PG3AuthenticationOkMessage goto: #InitializingBackend;
		on: PG3AuthenticationMD5Password 
		connectionDo: #respondToAuthenticationMD5PasswordRequest:
		goto: #AuthenticatingWithMD5