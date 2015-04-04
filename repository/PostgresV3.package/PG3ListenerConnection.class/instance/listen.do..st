listen-notify-subprotocol
listen: aString do: aValueable
	
	self killListenerProcess.
	super execute: 'listen ', aString asPG3SqlIdentifier.
	actions at: aString put: aValueable.
	self createListenerProcess