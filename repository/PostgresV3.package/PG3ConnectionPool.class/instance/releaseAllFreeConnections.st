private
releaseAllFreeConnections
	
	monitor critical: [
		[ freeConnections size > 0 ] whileTrue: [
			| connection |
			connection := freeConnections removeFirst.
			connection isConnected ifTrue: [ connection terminate ].
			self log: 'Connection removed from the pool.' ] ]