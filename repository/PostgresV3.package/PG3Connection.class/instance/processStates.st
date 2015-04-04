as yet unclassified
processStates
	
	[ state isStopState ] whileFalse: [
		| message |
		message := self receiveMessage.
		state := state receive: message from: self ]