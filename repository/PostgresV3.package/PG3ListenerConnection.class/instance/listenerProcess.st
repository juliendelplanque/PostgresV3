listen-notify-subprotocol
listenerProcess

	[ 
		| message |
		message := self receiveMessage.
		state := state receive: message from: self ] repeat