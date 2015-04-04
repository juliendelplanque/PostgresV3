private
releaseSuperfluousFreeConnections
	
	monitor critical: [
		[ freeConnections size > arguments maxFreeConnections ] whileTrue: [
			| connection |
			connection := freeConnections removeFirst.
			connection isConnected ifTrue: [ connection terminate ].
			self log: 'Connection removed from the pool.' ] ]