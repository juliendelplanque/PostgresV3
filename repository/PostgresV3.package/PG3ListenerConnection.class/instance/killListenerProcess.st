listen-notify-subprotocol
killListenerProcess 

	listenerProcess ifNotNil: [
		listenerProcess terminate.
		listenerProcess := nil ]