startup-protocol
startup

	self ensureConnection.
	self sendMessage: (PG3StartupMessage for: self).
	states := PG3ServerState createStateGraph.
	state := states at: #Authenticating.
	parameters := Dictionary new.
	self processStates.
	arguments automaticStringConversion
		ifFalse: [ self textConverter: PG3NullTextConverter new ]
		ifTrue: [ 
			self textConverter:(PG3SqueakTextConverter 
				for: (parameters 
					at: 'server_encoding'
					ifAbsent: [ 'UTF8' ])) ]