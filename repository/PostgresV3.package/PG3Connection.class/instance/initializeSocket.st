as yet unclassified
initializeSocket

	socket ifNotNil: [ socket destroy ].
	socket := Socket tcpCreateIfFail: [ self error: 'Could not create socket!' ].
	socketReadStream := PG3SocketReadStream on: socket