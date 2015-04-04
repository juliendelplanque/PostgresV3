initialize-release
initialize

	freeConnections := OrderedCollection new.
	usedConnections := OrderedCollection new.
	monitor := Monitor new.
	arguments := PG3ConnectionPoolArguments new