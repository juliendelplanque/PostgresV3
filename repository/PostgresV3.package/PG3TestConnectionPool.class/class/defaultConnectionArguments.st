as yet unclassified
defaultConnectionArguments

	^PG3ConnectionArguments new
		hostname: '127.0.0.1';
		port: 5432;
		username: 'test';
		password: 'test';
		databaseName: 'test';
		yourself