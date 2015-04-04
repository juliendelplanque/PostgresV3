as yet unclassified
ensureConnection

	self initializeSocket.
	socket 
		connectTo: (NetNameResolver
			addressForName: arguments hostname
			timeout: 20)
		port: arguments port
		waitForConnectionFor: arguments connectTimeout