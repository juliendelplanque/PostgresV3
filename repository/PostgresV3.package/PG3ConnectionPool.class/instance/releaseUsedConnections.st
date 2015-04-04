private
releaseUsedConnections
	
	monitor critical: [
		usedConnections copy do: [ :each |
			self releaseConnection: each ] ]