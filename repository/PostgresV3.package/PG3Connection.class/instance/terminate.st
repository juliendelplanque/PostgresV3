as yet unclassified
terminate

	socket ifNil: [ ^self ].
	socket isConnected ifTrue: [
		self sendMessage: PG3Terminate new.
		socket close ]