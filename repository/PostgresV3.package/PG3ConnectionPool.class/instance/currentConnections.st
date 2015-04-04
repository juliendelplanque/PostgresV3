accessing
currentConnections

	^monitor critical: [
		usedConnections size + freeConnections size ]